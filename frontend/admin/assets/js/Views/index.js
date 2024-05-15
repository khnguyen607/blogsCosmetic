function defaultFunc() {
    var divtoNew = document.querySelector('.news__info').cloneNode(true)
    // hàm hiển thị bài viết 
    async function show_news() {
        await Helper.fetchBackendLink()
        document.querySelector('.news__list').innerHTML = ''
        fetch(Helper.backendLink + '?controller=blog&action=getAllsFK')
            .then(response => response.json())
            .then(data => {
                // data = data.sort((a, b) => {
                //     return b.id - a.id
                // })
                // data = data.filter(item => {
                //     return item.status == '1'
                // })

                data.forEach(item => {
                    var divNew = divtoNew.cloneNode(true)
                    var td = divNew.querySelectorAll('td')
                    td[0].querySelector('a').textContent = item.Name
                    // td[0].querySelector('a').href = '../new.html?id=' + item.id
                    td[1].textContent = item.user
                    td[2].textContent = item.categoriesValue
                    td[3].textContent = item.Date
                    td[4].querySelector('a.delete').href = './backend/index.php?controller=new&action=delNew&id=' + item.ID
                    td[4].querySelector('a.edit').href = 'news_edit.html?edit=' + item.ID
                    document.querySelector('.news__list').appendChild(divNew)
                });

                new simpleDatatables.DataTable(document.querySelector('.datatable'), {
                    perPageSelect: [5, 10, 15, ["All", -1]]
                });
            })
    }

    // thực thi func 
    show_news()

}

document.addEventListener('DOMContentLoaded', defaultFunc)