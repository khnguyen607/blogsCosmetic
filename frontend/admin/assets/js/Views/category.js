function defaultFunc() {
    var divtoNew = document.querySelector('.category__info').cloneNode(true)
    // hàm hiển thị bài viết 
    async function show_category() {
        await Helper.fetchBackendLink()
        document.querySelector('.category__list').innerHTML = ''
        fetch(Helper.backendLink + '?controller=category')
            .then(response => response.json())
            .then(data => {
                data.forEach(item => {
                    var divNew = divtoNew.cloneNode(true)
                    var td = divNew.querySelectorAll('td')
                    td[0].textContent = item.Name
                    td[1].querySelector('a').addEventListener('click', async () => {
                        await Helper.fetchData('category&action=delete&id=' + item.ID)
                        location.reload()
                    })
                    document.querySelector('.category__list').appendChild(divNew)
                });

                new simpleDatatables.DataTable(document.querySelector('.datatabless'), {
                    perPageSelect: [5, 10, 15, ["All", -1]],
                });
            })
    }

    // thực thi func 
    show_category()


    document.querySelector("#insertCategoryForm").addEventListener('submit', (evt) => {
        evt.preventDefault()
        var formData = new FormData(document.querySelector("#insertCategoryForm"))
        fetch(Helper.backendLink + "?controller=category&action=insert", {
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
}

document.addEventListener('DOMContentLoaded', defaultFunc)