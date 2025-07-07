// تهيئة الصفحة عند التحميل
document.addEventListener('DOMContentLoaded', () => {
    // تحميل إحصائيات لوحة التحكم
    loadDashboardStats();
    
    // تحميل الطلبات الحديثة
    loadRecentOrders();
});

// تحميل إحصائيات لوحة التحكم
async function loadDashboardStats() {
    try {
        // طلب إحصائيات الطلبات الجديدة
        const pendingOrdersResponse = await Api.get(API_CONFIG.ORDERS.PENDING);
        
        if (pendingOrdersResponse.status === 'success') {
            // عرض عدد الطلبات الجديدة
            const pendingOrdersCount = document.getElementById('pending-orders-count');
            
            if (pendingOrdersCount) {
                pendingOrdersCount.textContent = pendingOrdersResponse.data ? pendingOrdersResponse.data.length : 0;
            }
        }
        
        // طلب إحصائيات المنتجات
        const itemsResponse = await Api.get(API_CONFIG.ITEMS.ALL);
        
        if (itemsResponse.status === 'success') {
            // عرض عدد المنتجات
            const totalItemsCount = document.getElementById('total-items-count');
            
            if (totalItemsCount) {
                totalItemsCount.textContent = itemsResponse.data ? itemsResponse.data.length : 0;
            }
        }
        
        // طلب إحصائيات التصنيفات
        const categoriesResponse = await Api.get(API_CONFIG.CATEGORIES.ALL);
        
        if (categoriesResponse.status === 'success') {
            // عرض عدد التصنيفات
            const categoriesCount = document.getElementById('categories-count');
            
            if (categoriesCount) {
                categoriesCount.textContent = categoriesResponse.data ? categoriesResponse.data.length : 0;
            }
        }
        
        // حساب إجمالي المبيعات من الطلبات المكتملة
        const archiveOrdersResponse = await Api.get(API_CONFIG.ORDERS.ARCHIVE);
        
        if (archiveOrdersResponse.status === 'success' && archiveOrdersResponse.data) {
            // حساب إجمالي المبيعات من الطلبات المكتملة
            const completedOrders = archiveOrdersResponse.data.filter(order => order.orders_status == 3);
            const totalSales = completedOrders.reduce((total, order) => total + parseFloat(order.orders_totalprice || 0), 0);
            
            // عرض إجمالي المبيعات
            const totalSalesElement = document.getElementById('total-sales');
            
            if (totalSalesElement) {
                totalSalesElement.textContent = totalSales.toFixed(2) + ' د.ع';
            }
        }
    } catch (error) {
        console.error('Error loading dashboard stats:', error);
    }
}

// تحميل الطلبات الحديثة
async function loadRecentOrders() {
    const recentOrdersTable = document.getElementById('recent-orders-table');
    
    if (!recentOrdersTable) {
        console.error('Recent orders table element not found');
        return;
    }
    
    try {
        // طلب الطلبات من الخادم
        const pendingResponse = await Api.get(API_CONFIG.ORDERS.PENDING);
        const archiveResponse = await Api.get(API_CONFIG.ORDERS.ARCHIVE);
        
        // دمج الطلبات الجديدة والمؤرشفة
        const allOrders = [];
        
        if (pendingResponse.status === 'success' && pendingResponse.data) {
            allOrders.push(...pendingResponse.data);
        }
        
        if (archiveResponse.status === 'success' && archiveResponse.data) {
            allOrders.push(...archiveResponse.data);
        }
        
        // ترتيب الطلبات حسب التاريخ (الأحدث أولاً)
        allOrders.sort((a, b) => {
            const dateA = new Date(a.orders_datetime);
            const dateB = new Date(b.orders_datetime);
            return dateB - dateA;
        });
        
        // أخذ أحدث 5 طلبات فقط
        const recentOrders = allOrders.slice(0, 5);
        
        // عرض الطلبات في الجدول
        recentOrdersTable.innerHTML = '';
        
        if (recentOrders.length === 0) {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td colspan="7" class="text-center">لا توجد طلبات حديثة</td>
            `;
            recentOrdersTable.appendChild(row);
        } else {
            recentOrders.forEach(order => {
                const row = document.createElement('tr');
                
                // تحديد نص حالة الطلب
                let statusText = '';
                let statusClass = '';
                
                switch (order.orders_status) {
                    case 0:
                        statusText = 'في الانتظار';
                        statusClass = 'warning';
                        break;
                    case 1:
                        statusText = 'مقبول';
                        statusClass = 'primary';
                        break;
                    case 2:
                        statusText = 'قيد التوصيل';
                        statusClass = 'info';
                        break;
                    case 3:
                        statusText = 'تم التوصيل';
                        statusClass = 'success';
                        break;
                    case 4:
                        statusText = 'مرفوض';
                        statusClass = 'danger';
                        break;
                    default:
                        statusText = 'غير معروف';
                        statusClass = 'secondary';
                        break;
                }
                
                // تهيئة المحتوى للصف
                row.innerHTML = `
                    <td>${order.orders_id}</td>
                    <td>${order.address_name || 'غير متوفر'}</td>
                    <td>${order.address_city || ''} - ${order.address_street || ''}</td>
                    <td>${order.orders_totalprice} د.ع</td>
                    <td>${formatDate(order.orders_datetime)}</td>
                    <td><span class="badge bg-${statusClass}">${statusText}</span></td>
                    <td>
                        <a href="pages/orders/${order.orders_status === 0 ? 'pending' : 'archive'}.html" class="btn btn-sm btn-primary">
                            <i class="fas fa-eye"></i> عرض
                        </a>
                    </td>
                `;
                
                recentOrdersTable.appendChild(row);
            });
        }
    } catch (error) {
        console.error('Error loading recent orders:', error);
        recentOrdersTable.innerHTML = `
            <tr>
                <td colspan="7" class="text-center text-danger">
                    حدث خطأ أثناء تحميل الطلبات الحديثة. يرجى تحديث الصفحة والمحاولة مرة أخرى.
                </td>
            </tr>
        `;
    }
}

// تنسيق التاريخ
function formatDate(dateString) {
    try {
        const date = new Date(dateString);
        
        // التحقق مما إذا كان التاريخ صالحًا
        if (isNaN(date.getTime())) {
            return dateString;
        }
        
        // تنسيق التاريخ باللغة العربية
        const options = {
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        };
        
        return date.toLocaleDateString('ar-EG', options);
    } catch (error) {
        return dateString;
    }
} 