function defaultFunc() {
    var divtoNew = document.querySelector('.user__info').cloneNode(true)
    // hàm hiển thị bài viết 
    async function show_user() {
        await Helper.fetchBackendLink()
        document.querySelector('.user__list').innerHTML = ''
        fetch(Helper.backendLink + '?controller=user')
            .then(response => response.json())
            .then(data => {
                data = data.filter(item=>{
                    return item.Role == '0'
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
                    document.querySelector('.user__list').appendChild(divNew)
                });

                new simpleDatatables.DataTable(document.querySelector('.datatabless'), {
                    perPageSelect: [5, 10, 15, ["All", -1]],
                });
            })
    }

    // thực thi func 
    show_user()

}

document.addEventListener('DOMContentLoaded', defaultFunc)