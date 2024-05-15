_setEffect();
document.addEventListener('DOMContentLoaded', async () => {
    await _getLayouts();
    _setUser()
})

async function _getLayouts() {
    try {
        // Get components
        var components = document.createElement("div")
        components.innerHTML = await Helper.fetchHTML("./shared/components/layout.html");
        document.querySelector("header.header").innerHTML = components.querySelector("header.header").innerHTML;
        document.querySelector("footer.footer-section").innerHTML = components.querySelector("footer.footer-section").innerHTML;

        var page = Helper.getParameter('page')
        if (page && page != "home") {
            document.querySelector(`.main-menu a[href='./?page=${page}']`).parentNode.classList.add('active')
        } else {
            document.querySelector(`.main-menu a[href='./']`).parentNode.classList.add('active')
        }
    } catch (error) {
        console.error('Error loading HTML:', error);
    }
}

async function _setEffect() {
    var style = document.createElement('style')
    style.innerHTML = `        
    body {
        opacity: 0;
        /* Apply transition effect to opacity property */
        transition: opacity 0.5s ease-in-out;
    }
    body.show {
        opacity: 1;
    }
    `
    document.head.appendChild(style)

    setTimeout(function () {
        var body = document.querySelector("body");
        body.classList.add("show");
    }, 100);
}

async function addScript(script) {
    var scriptElement = document.createElement("script")
    scriptElement.src = script
    document.body.appendChild(scriptElement)
}

async function _setUser() {
    var checkUser = Helper.getCookie('user_id')
    if (checkUser) {
        document.querySelector(".ht-us-menu").innerHTML = `
            <li><a href="#"><i class="fa fa-user-circle-o"></i>Xin chào, Nguyên</a>
                <ul class="ht-dropdown right">
                    <li><a href="./?page=myAccount">Tài khoản của tôi</a></li>
                    <li><a onclick="Helper.fetchData('user&action=logout'); location.reload()">Đăng xuất</a></li>
                </ul>
            </li>
        `
    } else {
        document.querySelector(".ht-us-menu").innerHTML = `
            <li class="loginLink"><a href="./?page=loginRegister">Đăng nhập</a></li>
        `
    }
}

