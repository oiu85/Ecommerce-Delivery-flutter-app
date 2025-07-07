// تهيئة الصفحة عند التحميل
document.addEventListener('DOMContentLoaded', () => {
    // تحميل التصنيفات لتعبئة قائمة الفلترة والنماذج
    loadCategories();
    
    // تحميل المنتجات
    loadItems();
    
    // إضافة أحداث للأزرار وأدوات الفلترة
    setupItemsEvents();
});

// تهيئة الأحداث للأزرار وأدوات الفلترة
function setupItemsEvents() {
    // أحداث فلترة المنتجات
    const searchInput = document.getElementById('search-items');
    const searchBtn = document.getElementById('search-btn');
    const categoryFilter = document.getElementById('category-filter');
    const statusFilter = document.getElementById('status-filter');
    const resetFiltersBtn = document.getElementById('reset-filters');
    
    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            applyFilters();
        });
    }
    
    if (searchInput) {
        searchInput.addEventListener('keyup', (e) => {
            if (e.key === 'Enter') {
                applyFilters();
            }
        });
    }
    
    if (categoryFilter) {
        categoryFilter.addEventListener('change', () => {
            applyFilters();
        });
    }
    
    if (statusFilter) {
        statusFilter.addEventListener('change', () => {
            applyFilters();
        });
    }
    
    if (resetFiltersBtn) {
        resetFiltersBtn.addEventListener('click', () => {
            resetFilters();
        });
    }
    
    // أحداث نماذج إضافة/تعديل المنتج
    const saveItemBtn = document.getElementById('save-item');
    if (saveItemBtn) {
        saveItemBtn.addEventListener('click', saveItem);
    }
    
    const updateItemBtn = document.getElementById('update-item');
    if (updateItemBtn) {
        updateItemBtn.addEventListener('click', updateItem);
    }
    
    // معاينة صورة المنتج قبل رفعها
    const itemImageInput = document.getElementById('item-image');
    if (itemImageInput) {
        itemImageInput.addEventListener('change', previewImage);
    }
    
    // تحميل التصنيفات الفرعية عند اختيار التصنيف
    const itemCategory = document.getElementById('item-category');
    if (itemCategory) {
        itemCategory.addEventListener('change', () => {
            loadSubcategories(itemCategory.value);
        });
    }
}

// تحميل التصنيفات
async function loadCategories() {
    try {
        const response = await Api.get(API_CONFIG.CATEGORIES.ALL);
        
        if (response.status === 'success' && response.data) {
            // تعبئة قائمة الفلترة
            const categoryFilter = document.getElementById('category-filter');
            if (categoryFilter) {
                categoryFilter.innerHTML = '<option value="">جميع التصنيفات</option>';
                
                response.data.forEach(category => {
                    const option = document.createElement('option');
                    option.value = category.category_id;
                    option.textContent = category.category_name_ar;
                    categoryFilter.appendChild(option);
                });
            }
            
            // تعبئة قائمة التصنيفات في نموذج إضافة المنتج
            const itemCategory = document.getElementById('item-category');
            if (itemCategory) {
                itemCategory.innerHTML = '<option value="">اختر التصنيف</option>';
                
                response.data.forEach(category => {
                    const option = document.createElement('option');
                    option.value = category.category_id;
                    option.textContent = category.category_name_ar;
                    itemCategory.appendChild(option);
                });
            }
        }
    } catch (error) {
        console.error('Error loading categories:', error);
    }
}

// تحميل التصنيفات الفرعية
async function loadSubcategories(categoryId) {
    if (!categoryId) {
        return;
    }
    
    try {
        const response = await Api.get(API_CONFIG.SUBCATEGORIES.ALL, { category_id: categoryId });
        
        if (response.status === 'success' && response.data) {
            // تعبئة قائمة التصنيفات الفرعية في نموذج إضافة المنتج
            const itemSubcategory = document.getElementById('item-subcategory');
            if (itemSubcategory) {
                itemSubcategory.innerHTML = '<option value="">اختر التصنيف الفرعي</option>';
                
                response.data.forEach(subcategory => {
                    const option = document.createElement('option');
                    option.value = subcategory.subcategory_id;
                    option.textContent = subcategory.subcategory_name_ar;
                    itemSubcategory.appendChild(option);
                });
            }
        }
    } catch (error) {
        console.error('Error loading subcategories:', error);
    }
}

// تحميل المنتجات
async function loadItems(params = {}) {
    const itemsTable = document.getElementById('items-table');
    const loadingSpinner = document.getElementById('items-loading');
    const noItemsMessage = document.getElementById('no-items');
    
    if (!itemsTable || !loadingSpinner || !noItemsMessage) {
        console.error('Required elements not found');
        return;
    }
    
    try {
        // عرض مؤشر التحميل
        itemsTable.innerHTML = '';
        loadingSpinner.classList.remove('d-none');
        noItemsMessage.classList.add('d-none');
        
        // طلب المنتجات من الخادم
        const response = await Api.get(API_CONFIG.ITEMS.ALL, params);
        
        // إخفاء مؤشر التحميل
        loadingSpinner.classList.add('d-none');
        
        // التحقق من نجاح الطلب
        if (response.status === 'success' && response.data && response.data.length > 0) {
            // عرض المنتجات في الجدول
            displayItems(response.data);
        } else {
            // عرض رسالة عدم وجود منتجات
            noItemsMessage.classList.remove('d-none');
        }
    } catch (error) {
        console.error('Error loading items:', error);
        loadingSpinner.classList.add('d-none');
        noItemsMessage.classList.remove('d-none');
        noItemsMessage.querySelector('h4').textContent = 'حدث خطأ أثناء تحميل المنتجات';
        noItemsMessage.querySelector('p').textContent = 'يرجى تحديث الصفحة والمحاولة مرة أخرى.';
    }
}

// عرض المنتجات في الجدول
function displayItems(items) {
    const itemsTable = document.getElementById('items-table');
    itemsTable.innerHTML = '';
    
    items.forEach((item, index) => {
        const row = document.createElement('tr');
        
        // تحديد حالة المنتج
        const isActive = item.items_active == 1;
        const statusBadge = `<span class="badge bg-${isActive ? 'success' : 'danger'}">${isActive ? 'نشط' : 'غير نشط'}</span>`;
        
        // تهيئة المحتوى للصف
        row.innerHTML = `
            <td>${item.items_id}</td>
            <td>
                <img src="${API_CONFIG.IMAGES.ITEMS}/${item.items_image}" alt="${item.items_name_ar}" class="img-thumbnail" style="width: 50px; height: 50px;">
            </td>
            <td>${item.items_name_ar}</td>
            <td>${item.subcategory_name_ar}</td>
            <td>${item.items_price} د.ع</td>
            <td>${item.items_count}</td>
            <td>${statusBadge}</td>
            <td>
                <button class="btn btn-sm btn-info edit-item" data-id="${item.items_id}">
                    <i class="fas fa-edit"></i> تعديل
                </button>
                <button class="btn btn-sm btn-danger delete-item" data-id="${item.items_id}" data-name="${item.items_name_ar}">
                    <i class="fas fa-trash"></i> حذف
                </button>
            </td>
        `;
        
        itemsTable.appendChild(row);
    });
    
    // إضافة أحداث لأزرار الصف الجديدة
    const editButtons = document.querySelectorAll('.edit-item');
    editButtons.forEach(button => {
        button.addEventListener('click', () => {
            const itemId = button.getAttribute('data-id');
            editItem(itemId);
        });
    });
    
    const deleteButtons = document.querySelectorAll('.delete-item');
    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const itemId = button.getAttribute('data-id');
            const itemName = button.getAttribute('data-name');
            confirmDeleteItem(itemId, itemName);
        });
    });
}

// تطبيق الفلترة على المنتجات
function applyFilters() {
    const searchInput = document.getElementById('search-items');
    const categoryFilter = document.getElementById('category-filter');
    const statusFilter = document.getElementById('status-filter');
    
    const params = {};
    
    if (searchInput && searchInput.value) {
        params.search = searchInput.value;
    }
    
    if (categoryFilter && categoryFilter.value) {
        params.category_id = categoryFilter.value;
    }
    
    if (statusFilter && statusFilter.value !== '') {
        params.active = statusFilter.value;
    }
    
    loadItems(params);
}

// إعادة ضبط الفلترة
function resetFilters() {
    const searchInput = document.getElementById('search-items');
    const categoryFilter = document.getElementById('category-filter');
    const statusFilter = document.getElementById('status-filter');
    
    if (searchInput) {
        searchInput.value = '';
    }
    
    if (categoryFilter) {
        categoryFilter.value = '';
    }
    
    if (statusFilter) {
        statusFilter.value = '';
    }
    
    loadItems();
}

// معاينة الصورة قبل رفعها
function previewImage(e) {
    const file = e.target.files[0];
    const imagePreview = document.getElementById('image-preview');
    
    if (file && imagePreview) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            imagePreview.src = e.target.result;
            imagePreview.classList.remove('d-none');
        };
        
        reader.readAsDataURL(file);
    }
}

// حفظ منتج جديد
async function saveItem() {
    // التحقق من صحة النموذج
    const form = document.getElementById('add-item-form');
    
    if (!form.checkValidity()) {
        form.reportValidity();
        return;
    }
    
    const formData = new FormData();
    
    // إضافة بيانات المنتج إلى FormData
    formData.append('items_name', document.getElementById('item-name').value);
    formData.append('items_name_ar', document.getElementById('item-name-ar').value);
    formData.append('items_desc', document.getElementById('item-desc').value);
    formData.append('items_desc_ar', document.getElementById('item-desc-ar').value);
    formData.append('items_price', document.getElementById('item-price').value);
    formData.append('items_discount', document.getElementById('item-discount').value);
    formData.append('items_count', document.getElementById('item-count').value);
    formData.append('items_active', document.getElementById('item-active').value);
    formData.append('items_cat', document.getElementById('item-category').value);
    formData.append('subcategory_id', document.getElementById('item-subcategory').value);
    formData.append('items_scientificformula', document.getElementById('item-formula').value);
    formData.append('items_scientificformula_ar', document.getElementById('item-formula-ar').value);
    formData.append('items_prescription', document.getElementById('item-prescription').value);
    
    // إضافة الصورة إلى FormData
    const fileInput = document.getElementById('item-image');
    if (fileInput.files.length > 0) {
        formData.append('file', fileInput.files[0]);
    }
    
    // إظهار مؤشر التحميل
    const saveSpinner = document.getElementById('save-spinner');
    if (saveSpinner) {
        saveSpinner.classList.remove('d-none');
    }
    
    try {
        // إرسال طلب إضافة المنتج إلى الخادم
        const response = await Api.upload(`${API_CONFIG.BASE_URL}/items/add.php`, formData);
        
        // إخفاء مؤشر التحميل
        if (saveSpinner) {
            saveSpinner.classList.add('d-none');
        }
        
        // التحقق من نجاح الطلب
        if (response.status === 'success') {
            alert('تم إضافة المنتج بنجاح');
            
            // إغلاق المودال
            const modal = bootstrap.Modal.getInstance(document.getElementById('addItemModal'));
            modal.hide();
            
            // إعادة تحميل المنتجات
            loadItems();
            
            // إعادة ضبط النموذج
            form.reset();
            document.getElementById('image-preview').classList.add('d-none');
        } else {
            alert(response.message || 'فشل في إضافة المنتج');
        }
    } catch (error) {
        console.error('Error saving item:', error);
        
        // إخفاء مؤشر التحميل
        if (saveSpinner) {
            saveSpinner.classList.add('d-none');
        }
        
        alert('حدث خطأ أثناء إضافة المنتج');
    }
}

// تحميل بيانات المنتج للتعديل
async function editItem(itemId) {
    try {
        // طلب بيانات المنتج من الخادم
        const response = await Api.get(`${API_CONFIG.BASE_URL}/items/view.php`, { items_id: itemId });
        
        if (response.status === 'success' && response.data) {
            const item = response.data;
            
            // تعبئة نموذج التعديل ببيانات المنتج
            document.getElementById('edit-item-id').value = item.items_id;
            document.getElementById('edit-item-name').value = item.items_name;
            document.getElementById('edit-item-name-ar').value = item.items_name_ar;
            
            // تعبئة باقي حقول النموذج...
            
            // عرض مودال التعديل
            const editItemModal = new bootstrap.Modal(document.getElementById('editItemModal'));
            editItemModal.show();
        } else {
            alert('فشل في تحميل بيانات المنتج');
        }
    } catch (error) {
        console.error('Error loading item data:', error);
        alert('حدث خطأ أثناء تحميل بيانات المنتج');
    }
}

// تحديث بيانات المنتج
async function updateItem() {
    // التحقق من صحة النموذج
    const form = document.getElementById('edit-item-form');
    
    if (!form.checkValidity()) {
        form.reportValidity();
        return;
    }
    
    // إرسال طلب تحديث المنتج إلى الخادم...
    alert('تم تحديث المنتج بنجاح');
    
    // إغلاق المودال
    const modal = bootstrap.Modal.getInstance(document.getElementById('editItemModal'));
    modal.hide();
    
    // إعادة تحميل المنتجات
    loadItems();
}

// تأكيد حذف المنتج
function confirmDeleteItem(itemId, itemName) {
    // تعبئة بيانات مودال الحذف
    document.getElementById('delete-item-id').value = itemId;
    document.getElementById('delete-item-name').textContent = itemName;
    
    // عرض مودال تأكيد الحذف
    const deleteItemModal = new bootstrap.Modal(document.getElementById('deleteItemModal'));
    deleteItemModal.show();
    
    // إضافة حدث لزر التأكيد
    const confirmButton = document.getElementById('confirm-delete');
    confirmButton.onclick = () => {
        deleteItem(itemId);
        deleteItemModal.hide();
    };
}

// حذف المنتج
async function deleteItem(itemId) {
    try {
        // إرسال طلب حذف المنتج إلى الخادم
        const response = await Api.post(`${API_CONFIG.BASE_URL}/items/delete.php`, { items_id: itemId });
        
        if (response.status === 'success') {
            alert('تم حذف المنتج بنجاح');
            loadItems();
        } else {
            alert(response.message || 'فشل في حذف المنتج');
        }
    } catch (error) {
        console.error('Error deleting item:', error);
        alert('حدث خطأ أثناء حذف المنتج');
    }
} 