document.addEventListener('DOMContentLoaded', async () => {
    function getCookie(cookieName) {
        var name = cookieName + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var cookieArray = decodedCookie.split(';');

        for (var i = 0; i < cookieArray.length; i++) {
            var cookie = cookieArray[i];
            while (cookie.charAt(0) == ' ') {
                cookie = cookie.substring(1);
            }
            if (cookie.indexOf(name) == 0) {
                return cookie.substring(name.length, cookie.length);
            }
        }

        return "";
    }

    if (!getCookie('user_id')) {
        window.location.href = 'login.html'
    }
    fetch('layout.html')
        .then(response => response.text())
        .then(async data => {
            var userInfo = await Helper.fetchData("user&action=find&id=" + getCookie('user_id'))

            if (userInfo.Role == 0) {
                window.location.href = 'login.html'
            }

            var div = document.createElement('div')
            div.innerHTML = data
            document.querySelector('#header').innerHTML = div.querySelector('#header').innerHTML
            document.querySelector('#sidebar').innerHTML = div.querySelector('#sidebar').innerHTML

            // active nav 
            if (window.location.href.includes('/index.html')) {
                document.querySelectorAll('.nav-link.collapsed')[0].classList.remove('collapsed')
                document.querySelector('#news__nav').classList.add('show')
                document.querySelector('#news__nav a[href="index.html"]').classList.add('active')
            } else if (window.location.href.includes('/category.html')) {
                document.querySelectorAll('.nav-link.collapsed')[0].classList.remove('collapsed')
                document.querySelector('#news__nav').classList.add('show')
                document.querySelector('#news__nav a[href="category.html"]').classList.add('active')
            } else if (window.location.href.includes('/user.html')) {
                document.querySelectorAll('.nav-link.collapsed')[1].classList.remove('collapsed')
                document.querySelector('#users__nav').classList.add('show')
                document.querySelector('#users__nav a[href="user.html"]').classList.add('active')
            } else if (window.location.href.includes('/author.html')) {
                document.querySelectorAll('.nav-link.collapsed')[1].classList.remove('collapsed')
                document.querySelector('#users__nav').classList.add('show')
                document.querySelector('#users__nav a[href="author.html"]').classList.add('active')
            } else if (window.location.href.includes('/comment.html')) {
                document.querySelectorAll('.nav-link.collapsed')[2].classList.remove('collapsed')
            }

            // Đổ ra nội dung tên người dùng hiện tại
            fetch(Helper.backendLink + '?controller=user&action=find&id=' + getCookie('user_id'))
                .then(response => response.json())
                .then(data => {
                    document.querySelector('.nav__user span.d-md-block').textContent = data.Name
                    document.querySelector('.nav__user .dropdown-header h6').textContent = data.Name
                    switch (data.Role) {
                        case '1':
                            document.querySelector('.nav__user .dropdown-header span').textContent = 'Tác giả'
                            break;
                        case '2':
                            document.querySelector('.nav__user .dropdown-header span').textContent = 'Quản trị viên'
                            document.querySelector('.side__user').classList.remove('d-none')
                            document.querySelector('.side__cmt').classList.remove('d-none')
                            break;
                    }

                })
        })
})