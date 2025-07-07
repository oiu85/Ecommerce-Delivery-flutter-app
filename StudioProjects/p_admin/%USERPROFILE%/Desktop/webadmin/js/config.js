// تكوين الاتصال بواجهة برمجة التطبيقات API
const API_CONFIG = {
    // عنوان الخادم الأساسي (يمكن تغييره حسب بيئة التشغيل)
    BASE_URL: "http://localhost/ecommerce",
    
    // عناوين الصور
    IMAGES: {
        BASE: "http://localhost/ecommerce/upload",
        CATEGORIES: "http://localhost/ecommerce/upload/categories",
        ITEMS: "http://localhost/ecommerce/upload/items",
        SUBCATEGORIES: "http://localhost/ecommerce/upload/subcategories"
    },
    
    // مسارات المصادقة
    AUTH: {
        LOGIN: "http://localhost/ecommerce/admin/auth/login.php",
        SIGNUP: "http://localhost/ecommerce/admin/auth/signup.php",
        VERIFY: "http://localhost/ecommerce/admin/auth/verfiycode.php",
        RESEND: "http://localhost/ecommerce/admin/auth/resend.php"
    },
    
    // مسارات استعادة كلمة المرور
    PASSWORD: {
        CHECK_EMAIL: "http://localhost/ecommerce/admin/forgetpassword/checkemail.php",
        VERIFY_CODE: "http://localhost/ecommerce/admin/forgetpassword/verfiycode.php",
        RESET: "http://localhost/ecommerce/admin/forgetpassword/resetpassword.php"
    },
    
    // مسارات الطلبات
    ORDERS: {
        PENDING: "http://localhost/ecommerce/delivery/orders/pending.php",
        ACCEPTED: "http://localhost/ecommerce/delivery/orders/accepted.php",
        DETAILS: "http://localhost/ecommerce/delivery/orders/details.php",
        ARCHIVE: "http://localhost/ecommerce/delivery/orders/archive.php",
        APPROVE: "http://localhost/ecommerce/delivery/orders/approve.php",
        DONE: "http://localhost/ecommerce/delivery/orders/done.php"
    },
    
    // مسارات المنتجات والتصنيفات
    ITEMS: {
        ALL: "http://localhost/ecommerce/items/items.php",
        SEARCH: "http://localhost/ecommerce/items/search.php"
    },
    
    CATEGORIES: {
        ALL: "http://localhost/ecommerce/categories/view.php"
    },
    
    SUBCATEGORIES: {
        ALL: "http://localhost/ecommerce/subcategories/view.php"
    }
};

// دوال مساعدة للتعامل مع التخزين المحلي
const Storage = {
    // حفظ البيانات في التخزين المحلي
    set: (key, value) => {
        if (typeof value === 'object') {
            localStorage.setItem(key, JSON.stringify(value));
        } else {
            localStorage.setItem(key, value);
        }
    },
    
    // استرجاع البيانات من التخزين المحلي
    get: (key) => {
        const value = localStorage.getItem(key);
        try {
            return JSON.parse(value);
        } catch (e) {
            return value;
        }
    },
    
    // حذف البيانات من التخزين المحلي
    remove: (key) => {
        localStorage.removeItem(key);
    },
    
    // حفظ بيانات المستخدم المسجل دخوله
    setUser: (userData) => {
        Storage.set('user', userData);
    },
    
    // استرجاع بيانات المستخدم المسجل دخوله
    getUser: () => {
        return Storage.get('user');
    },
    
    // حفظ رمز الوصول (token)
    setToken: (token) => {
        Storage.set('token', token);
    },
    
    // استرجاع رمز الوصول
    getToken: () => {
        return Storage.get('token');
    },
    
    // التحقق مما إذا كان المستخدم مسجل دخوله
    isLoggedIn: () => {
        return !!Storage.getToken();
    },
    
    // تسجيل خروج المستخدم
    logout: () => {
        Storage.remove('user');
        Storage.remove('token');
    }
};

// دوال مساعدة لإرسال طلبات HTTP
const Api = {
    // إضافة رمز الوصول إلى رؤوس الطلب
    getHeaders: () => {
        const headers = {
            'Content-Type': 'application/json'
        };
        
        const token = Storage.getToken();
        if (token) {
            headers['Authorization'] = `Bearer ${token}`;
        }
        
        return headers;
    },
    
    // إرسال طلب GET
    get: async (url, params = {}) => {
        // إضافة المعلمات إلى عنوان URL
        const queryString = Object.keys(params)
            .map(key => `${encodeURIComponent(key)}=${encodeURIComponent(params[key])}`)
            .join('&');
            
        const fullUrl = queryString ? `${url}?${queryString}` : url;
        
        try {
            const response = await fetch(fullUrl, {
                method: 'GET',
                headers: Api.getHeaders()
            });
            
            return await response.json();
        } catch (error) {
            console.error('API GET Error:', error);
            throw error;
        }
    },
    
    // إرسال طلب POST
    post: async (url, data = {}) => {
        try {
            const response = await fetch(url, {
                method: 'POST',
                headers: Api.getHeaders(),
                body: JSON.stringify(data)
            });
            
            return await response.json();
        } catch (error) {
            console.error('API POST Error:', error);
            throw error;
        }
    },
    
    // إرسال طلب لرفع ملف
    upload: async (url, formData) => {
        try {
            const headers = {};
            const token = Storage.getToken();
            
            if (token) {
                headers['Authorization'] = `Bearer ${token}`;
            }
            
            const response = await fetch(url, {
                method: 'POST',
                headers: headers,
                body: formData
            });
            
            return await response.json();
        } catch (error) {
            console.error('API Upload Error:', error);
            throw error;
        }
    }
};

// تصدير الكائنات للاستخدام في الملفات الأخرى
window.API_CONFIG = API_CONFIG;
window.Storage = Storage;
window.Api = Api; 