// التحقق من حالة تسجيل الدخول عند تحميل الصفحة
document.addEventListener('DOMContentLoaded', () => {
    // تحويل المستخدم غير المسجل إلى صفحة تسجيل الدخول
    // باستثناء صفحات التي لا تتطلب تسجيل الدخول
    const isLoginPage = window.location.href.includes('/auth/login.html') || 
                        window.location.href.includes('/auth/signup.html') || 
                        window.location.href.includes('/auth/forgot-password.html');
    
    if (!Storage.isLoggedIn() && !isLoginPage) {
        // إذا لم يكن المستخدم مسجلاً، قم بتوجيهه إلى صفحة تسجيل الدخول
        window.location.href = window.location.href.includes('/pages/') 
            ? '../../pages/auth/login.html' 
            : 'pages/auth/login.html';
    } else if (Storage.isLoggedIn() && isLoginPage) {
        // إذا كان المستخدم مسجلاً بالفعل وفي صفحة تسجيل الدخول، قم بتوجيهه إلى الصفحة الرئيسية
        window.location.href = window.location.href.includes('/pages/') 
            ? '../../index.html' 
            : 'index.html';
    }
    
    // تهيئة معالج تسجيل الخروج إذا كان الزر موجودًا
    const logoutBtn = document.getElementById('logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', handleLogout);
    }
    
    // تهيئة نموذج تسجيل الدخول إذا كان موجودًا
    const loginForm = document.getElementById('login-form');
    if (loginForm) {
        loginForm.addEventListener('submit', handleLogin);
    }
    
    // تبديل رؤية كلمة المرور
    const togglePasswordBtns = document.querySelectorAll('.toggle-password');
    if (togglePasswordBtns.length > 0) {
        togglePasswordBtns.forEach(btn => {
            btn.addEventListener('click', togglePasswordVisibility);
        });
    }
});

// معالجة تسجيل الدخول
async function handleLogin(e) {
    e.preventDefault();
    
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const loginError = document.getElementById('login-error');
    const loginSpinner = document.getElementById('login-spinner');
    
    if (!email || !password) {
        if (loginError) {
            loginError.textContent = 'يرجى إدخال البريد الإلكتروني وكلمة المرور';
            loginError.classList.remove('d-none');
        }
        return;
    }
    
    try {
        // إظهار مؤشر التحميل
        if (loginSpinner) {
            loginSpinner.classList.remove('d-none');
        }
        
        // إرسال طلب تسجيل الدخول إلى الخادم
        const response = await Api.post(API_CONFIG.AUTH.LOGIN, {
            email: email,
            password: password
        });
        
        // إخفاء مؤشر التحميل
        if (loginSpinner) {
            loginSpinner.classList.add('d-none');
        }
        
        // التحقق من نجاح تسجيل الدخول
        if (response.status === 'success') {
            // حفظ بيانات المستخدم ورمز الوصول
            Storage.setUser(response.data.user_data);
            Storage.setToken(response.data.token);
            
            // توجيه المستخدم إلى الصفحة الرئيسية
            window.location.href = window.location.href.includes('/pages/') 
                ? '../../index.html' 
                : 'index.html';
        } else {
            // عرض رسالة الخطأ
            if (loginError) {
                loginError.textContent = response.message || 'فشل تسجيل الدخول. يرجى التحقق من بياناتك.';
                loginError.classList.remove('d-none');
            }
        }
    } catch (error) {
        console.error('Login Error:', error);
        
        // إخفاء مؤشر التحميل
        if (loginSpinner) {
            loginSpinner.classList.add('d-none');
        }
        
        // عرض رسالة الخطأ
        if (loginError) {
            loginError.textContent = 'حدث خطأ أثناء الاتصال بالخادم. يرجى المحاولة مرة أخرى.';
            loginError.classList.remove('d-none');
        }
    }
}

// معالجة تسجيل الخروج
function handleLogout() {
    // حذف بيانات المستخدم ورمز الوصول من التخزين المحلي
    Storage.logout();
    
    // توجيه المستخدم إلى صفحة تسجيل الدخول
    window.location.href = window.location.href.includes('/pages/') 
        ? '../../pages/auth/login.html' 
        : 'pages/auth/login.html';
}

// تبديل رؤية كلمة المرور
function togglePasswordVisibility(e) {
    const button = e.currentTarget;
    const passwordInput = button.parentElement.querySelector('input');
    const icon = button.querySelector('i');
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
} 