function defaultFunc() {
    document.querySelector("#login-form").addEventListener('submit', (evt) => {
        evt.preventDefault();
        // Tạo một đối tượng FormData và thêm dữ liệu vào đó
        const formData = new FormData(document.querySelector("#login-form"));

        // Tạo một yêu cầu fetch với phương thức POST và dữ liệu FormData trong phần thân
        fetch(Helper.backendLink + "?controller=user&action=login", {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data) {
                    alert('Đăng nhập thành công')
                    // location.reload()
                } else {
                    alert('Tên tài khoản, mật khẩu không đúng!')
                }
            })
            .catch(error => {
                alert('Lỗi khi đăng nhập!')
                console.error(error);
            });
    })

    var loginF = new URLSearchParams(window.location.search).get('loginF')
    if (loginF) {
        document.querySelector('#user').value = loginF
        document.querySelector('.loginF').classList.remove('d-none')
        console.log(document.querySelector('.loginF'))
    }
}

document.addEventListener('DOMContentLoaded', defaultFunc)