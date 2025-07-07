// تهيئة الصفحة عند التحميل
document.addEventListener('DOMContentLoaded', () => {
    // تحديد نوع الصفحة (الطلبات الجديدة أو أرشيف الطلبات)
    const isPendingPage = window.location.href.includes('pending.html');
    
    // تحميل الطلبات المناسبة حسب نوع الصفحة
    if (isPendingPage) {
        loadPendingOrders();
    } else if (window.location.href.includes('archive.html')) {
        loadArchivedOrders();
    }
    
    // إضافة أحداث لأزرار التفاصيل والموافقة ورفض الطلبات
    setupOrderDetailsEvents();
});

// تحميل الطلبات الجديدة
async function loadPendingOrders() {
    const ordersTable = document.getElementById('pending-orders-table');
    const loadingSpinner = document.getElementById('orders-loading');
    const noOrdersMessage = document.getElementById('no-orders');
    
    if (!ordersTable || !loadingSpinner || !noOrdersMessage) {
        console.error('Required elements not found');
        return;
    }
    
    try {
        // عرض مؤشر التحميل
        ordersTable.innerHTML = '';
        loadingSpinner.classList.remove('d-none');
        noOrdersMessage.classList.add('d-none');
        
        // طلب الطلبات الجديدة من الخادم
        const response = await Api.get(API_CONFIG.ORDERS.PENDING);
        
        // إخفاء مؤشر التحميل
        loadingSpinner.classList.add('d-none');
        
        // التحقق من نجاح الطلب
        if (response.status === 'success' && response.data && response.data.length > 0) {
            // عرض الطلبات في الجدول
            displayOrders(response.data, ordersTable, true);
        } else {
            // عرض رسالة عدم وجود طلبات
            noOrdersMessage.classList.remove('d-none');
        }
    } catch (error) {
        console.error('Error loading pending orders:', error);
        loadingSpinner.classList.add('d-none');
        noOrdersMessage.classList.remove('d-none');
        noOrdersMessage.querySelector('h4').textContent = 'حدث خطأ أثناء تحميل الطلبات';
        noOrdersMessage.querySelector('p').textContent = 'يرجى تحديث الصفحة والمحاولة مرة أخرى.';
    }
}

// تحميل الطلبات المؤرشفة
async function loadArchivedOrders() {
    const ordersTable = document.getElementById('archive-orders-table');
    const loadingSpinner = document.getElementById('orders-loading');
    const noOrdersMessage = document.getElementById('no-orders');
    
    if (!ordersTable || !loadingSpinner || !noOrdersMessage) {
        console.error('Required elements not found');
        return;
    }
    
    try {
        // عرض مؤشر التحميل
        ordersTable.innerHTML = '';
        loadingSpinner.classList.remove('d-none');
        noOrdersMessage.classList.add('d-none');
        
        // طلب الطلبات المؤرشفة من الخادم
        const response = await Api.get(API_CONFIG.ORDERS.ARCHIVE);
        
        // إخفاء مؤشر التحميل
        loadingSpinner.classList.add('d-none');
        
        // التحقق من نجاح الطلب
        if (response.status === 'success' && response.data && response.data.length > 0) {
            // عرض الطلبات في الجدول
            displayOrders(response.data, ordersTable, false);
        } else {
            // عرض رسالة عدم وجود طلبات
            noOrdersMessage.classList.remove('d-none');
        }
    } catch (error) {
        console.error('Error loading archived orders:', error);
        loadingSpinner.classList.add('d-none');
        noOrdersMessage.classList.remove('d-none');
        noOrdersMessage.querySelector('h4').textContent = 'حدث خطأ أثناء تحميل الطلبات';
        noOrdersMessage.querySelector('p').textContent = 'يرجى تحديث الصفحة والمحاولة مرة أخرى.';
    }
}

// عرض الطلبات في الجدول
function displayOrders(orders, tableElement, isPending) {
    tableElement.innerHTML = '';
    
    orders.forEach((order, index) => {
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
            <td>${order.orders_datetime}</td>
            <td><span class="badge bg-${statusClass}">${statusText}</span></td>
            <td>
                <button class="btn btn-sm btn-info view-order" data-id="${order.orders_id}">
                    <i class="fas fa-eye"></i> عرض
                </button>
                ${isPending ? `
                <button class="btn btn-sm btn-success approve-order" data-id="${order.orders_id}">
                    <i class="fas fa-check"></i> قبول
                </button>
                <button class="btn btn-sm btn-danger reject-order" data-id="${order.orders_id}">
                    <i class="fas fa-times"></i> رفض
                </button>
                ` : ''}
            </td>
        `;
        
        tableElement.appendChild(row);
    });
    
    // إضافة أحداث لأزرار الصف الجديدة
    const viewButtons = document.querySelectorAll('.view-order');
    viewButtons.forEach(button => {
        button.addEventListener('click', () => {
            const orderId = button.getAttribute('data-id');
            showOrderDetails(orderId);
        });
    });
    
    if (isPending) {
        // إضافة أحداث لأزرار الموافقة والرفض
        const approveButtons = document.querySelectorAll('.approve-order');
        approveButtons.forEach(button => {
            button.addEventListener('click', () => {
                const orderId = button.getAttribute('data-id');
                approveOrder(orderId);
            });
        });
        
        const rejectButtons = document.querySelectorAll('.reject-order');
        rejectButtons.forEach(button => {
            button.addEventListener('click', () => {
                const orderId = button.getAttribute('data-id');
                rejectOrder(orderId);
            });
        });
    }
}

// إعداد أحداث للأزرار في المودال
function setupOrderDetailsEvents() {
    const orderDetailsModal = document.getElementById('orderDetailsModal');
    
    if (orderDetailsModal) {
        const approveButton = document.getElementById('approve-order');
        const rejectButton = document.getElementById('reject-order');
        
        if (approveButton) {
            approveButton.addEventListener('click', () => {
                const orderId = document.getElementById('order-id').textContent;
                approveOrder(orderId);
                const modal = bootstrap.Modal.getInstance(orderDetailsModal);
                modal.hide();
            });
        }
        
        if (rejectButton) {
            rejectButton.addEventListener('click', () => {
                const orderId = document.getElementById('order-id').textContent;
                rejectOrder(orderId);
                const modal = bootstrap.Modal.getInstance(orderDetailsModal);
                modal.hide();
            });
        }
    }
}

// عرض تفاصيل الطلب
async function showOrderDetails(orderId) {
    try {
        // طلب تفاصيل الطلب من الخادم
        const response = await Api.get(API_CONFIG.ORDERS.DETAILS, { orders_id: orderId });
        
        if (response.status === 'success' && response.data) {
            const order = response.data.order;
            const items = response.data.items || [];
            
            // تعبئة بيانات المودال بتفاصيل الطلب
            document.getElementById('order-id').textContent = order.orders_id;
            document.getElementById('customer-name').textContent = order.address_name || 'غير متوفر';
            document.getElementById('customer-address').textContent = order.address_street || 'غير متوفر';
            document.getElementById('customer-city').textContent = order.address_city || 'غير متوفر';
            document.getElementById('order-number').textContent = order.orders_id;
            document.getElementById('order-date').textContent = order.orders_datetime;
            
            // تحديد طريقة الدفع
            let paymentMethod = 'غير معروف';
            if (order.orders_paymrntmethod === 0) {
                paymentMethod = 'نقداً عند الاستلام';
            } else if (order.orders_paymrntmethod === 1) {
                paymentMethod = 'بطاقة ائتمان';
            }
            document.getElementById('payment-method').textContent = paymentMethod;
            
            // عرض عناصر الطلب
            const orderItemsTable = document.getElementById('order-items');
            orderItemsTable.innerHTML = '';
            
            let subtotal = 0;
            
            items.forEach(item => {
                const row = document.createElement('tr');
                const itemTotal = item.itemsprice * item.items_count;
                subtotal += itemTotal;
                
                row.innerHTML = `
                    <td>${item.items_name}</td>
                    <td>${item.itemsprice} د.ع</td>
                    <td>${item.items_count}</td>
                    <td>${itemTotal} د.ع</td>
                `;
                
                orderItemsTable.appendChild(row);
            });
            
            // تعبئة معلومات الإجمالي
            document.getElementById('subtotal').textContent = subtotal + ' د.ع';
            document.getElementById('delivery-fee').textContent = (order.orders_pricedelivery || 0) + ' د.ع';
            document.getElementById('discount').textContent = '0 د.ع';
            document.getElementById('total').textContent = order.orders_totalprice + ' د.ع';
            
            // عرض المودال
            const orderDetailsModal = new bootstrap.Modal(document.getElementById('orderDetailsModal'));
            orderDetailsModal.show();
        } else {
            alert('فشل في تحميل تفاصيل الطلب');
        }
    } catch (error) {
        console.error('Error loading order details:', error);
        alert('حدث خطأ أثناء تحميل تفاصيل الطلب');
    }
}

// الموافقة على الطلب
async function approveOrder(orderId) {
    if (!confirm('هل أنت متأكد من قبول هذا الطلب؟')) {
        return;
    }
    
    try {
        const response = await Api.post(API_CONFIG.ORDERS.APPROVE, {
            orders_id: orderId,
            orders_status: 1 // حالة القبول
        });
        
        if (response.status === 'success') {
            alert('تم قبول الطلب بنجاح');
            loadPendingOrders();
        } else {
            alert(response.message || 'فشل في قبول الطلب');
        }
    } catch (error) {
        console.error('Error approving order:', error);
        alert('حدث خطأ أثناء قبول الطلب');
    }
}

// رفض الطلب
async function rejectOrder(orderId) {
    if (!confirm('هل أنت متأكد من رفض هذا الطلب؟')) {
        return;
    }
    
    try {
        const response = await Api.post(API_CONFIG.ORDERS.APPROVE, {
            orders_id: orderId,
            orders_status: 4 // حالة الرفض
        });
        
        if (response.status === 'success') {
            alert('تم رفض الطلب بنجاح');
            loadPendingOrders();
        } else {
            alert(response.message || 'فشل في رفض الطلب');
        }
    } catch (error) {
        console.error('Error rejecting order:', error);
        alert('حدث خطأ أثناء رفض الطلب');
    }
} 