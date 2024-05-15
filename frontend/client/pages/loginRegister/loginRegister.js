document.addEventListener('DOMContentLoaded', async () => {
    await _authentication()
})

async function _authentication() {
    document.querySelector(".register-form form").addEventListener('submit', async (evt) => {
        evt.preventDefault();
        // Tạo một đối tượng FormData và thêm dữ liệu vào đó
        const formData = new FormData(document.querySelector(".register-form form"));

        // Tạo một yêu cầu fetch với phương thức POST và dữ liệu FormData trong phần thân
        fetch(Helper.backendLink + "?controller=user&action=insert", {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data) {
                    alert('Đăng ký thành công')
                    location.reload()
                } else {
                    alert('Tên đăng nhập đã tồn tại!')
                }
            })
            .catch(error => {
                alert('Lỗi tạo tài khoản!')
                console.error(error);
            });
    })

    document.querySelector(".login-form form").addEventListener('submit', async (evt) => {
        evt.preventDefault();
        // Tạo một đối tượng FormData và thêm dữ liệu vào đó
        const formData = new FormData(document.querySelector(".login-form form"));

        // Tạo một yêu cầu fetch với phương thức POST và dữ liệu FormData trong phần thân
        fetch(Helper.backendLink + "?controller=user&action=login", {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data) {
                    alert('Đăng nhập thành công')
                    location.reload()
                } else {
                    alert('Tên tài khoản, mật khẩu không đúng!')
                }
            })
            .catch(error => {
                alert('Lỗi khi đăng nhập!')
                console.error(error);
            });
    })
}