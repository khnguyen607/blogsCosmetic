function defaultFunc() {
    var signupF = new URLSearchParams(window.location.search).get('signupF')
    if (signupF) alert(`Tên đăng nhập '${signupF}' đã tồn tại`)
    var divtoNew = document.querySelector('.author__info').cloneNode(true)
    // hàm hiển thị bài viết 
    async function show_author() {
        await Helper.fetchBackendLink()
        document.querySelector('.author__list').innerHTML = ''
        fetch(Helper.backendLink + '?controller=user')
            .then(response => response.json())
            .then(data => {
                data = data.filter(item => {
                    return item.Role == '1'
                })
                data.forEach(item => {
                    var divNew = divtoNew.cloneNode(true)
                    var td = divNew.querySelectorAll('td')
                    td[0].textContent = item.Name
                    td[1].textContent = item.Username
                    td[2].querySelector('a').addEventListener('click', async () => {
                        await Helper.fetchData('user&action=delete&id=' + item.ID)
                        location.reload()
                    })
                    document.querySelector('.author__list').appendChild(divNew)
                });

                new simpleDatatables.DataTable(document.querySelector('.datatabless'), {
                    perPageSelect: [5, 10, 15, ["All", -1]],
                });
            })
    }

    document.querySelector("#insertAuthorForm").addEventListener('submit', (evt) => {
        evt.preventDefault()
        var formData = new FormData(document.querySelector("#insertAuthorForm"))
        formData.append('Role', 1)
        fetch(Helper.backendLink + "?controller=user&action=insert", {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data) {
                    alert('Thêm thành công')
                    location.reload()
                } else {
                    alert('Thêm thất bại!')
                }
            })
            .catch(error => {
                alert('Lỗi khi thêm!')
                console.error(error);
            });
    })
    // thực thi func 
    show_author()

}

document.addEventListener('DOMContentLoaded', defaultFunc)