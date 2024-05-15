function defaultFunc() {
    var divtoNew = document.querySelector('.comment__info').cloneNode(true)
    // hàm hiển thị bài viết 
    async function show_comment() {
        await Helper.fetchBackendLink()
        document.querySelector('.comment__list').innerHTML = ''
        fetch(Helper.backendLink + '?controller=comment&action=allsFK')
            .then(response => response.json())
            .then(data => {
                data.forEach(item => {
                    var divNew = divtoNew.cloneNode(true)
                    var td = divNew.querySelectorAll('td')
                    td[0].textContent = item.blogName
                    td[1].textContent = item.userName
                    td[2].textContent = item.Content
                    td[3].textContent = item.Date
                    td[4].querySelector('a').addEventListener('click', async () => {
                        await Helper.fetchData('comment&action=delete&id=' + item.ID)
                        location.reload()
                    })
                    document.querySelector('.comment__list').appendChild(divNew)
                });

                new simpleDatatables.DataTable(document.querySelector('.datatabless'), {
                    perPageSelect: [5, 10, 15, ["All", -1]],
                });
            })
    }

    // thực thi func 
    show_comment()

}

document.addEventListener('DOMContentLoaded', defaultFunc)