document.addEventListener('DOMContentLoaded', async () => {
    // await Helper.fetchBackendLink();
    // Đổ danh sách sản phẩm
    _init();
})

async function _init() {
    var items = await Helper.fetchData("blog")
    showDatas(items)
    // Thêm sự kiện lọc giá khi bấm lọc
    // document.querySelector(".price-range-area .text-uppercase").addEventListener('click', () => filterBy())
    // document.querySelector(".shop_sidebar_searchbar i").addEventListener('click', () => filterBy())
}

async function filterBy() {
    document.querySelectorAll("#grid .col-lg-3").forEach(item => {
        if (
            byName(item.querySelector(".product-name a").textContent)
        ) {
            item.classList.remove("d-none")
        } else {
            item.classList.add("d-none")
        }
    })

    // Lọc theo tên
    function byName(name) {
        var nameValue = Helper.getParameterByName('q')
        if (name.toLowerCase().includes(nameValue.toLowerCase())) {
            return true
        } else {
            return false
        }
    }

}

async function showDatas(items) {
    var dataList = document.querySelector(".dataList")
    var dataItem = dataList.querySelector(".dataItem").cloneNode(true)
    dataList.innerHTML = ""
    await items.forEach(item => {
        let cloneData = dataItem.cloneNode(true)

        cloneData.querySelector(".title a").textContent = item.Name
        cloneData.querySelectorAll("a[href='./?page=blogDetails']").forEach(i=>i.href=`./?page=blogDetails&id=${item.ID}`)
        cloneData.querySelector("img").src = Helper.getLink(item.Img)
        cloneData.querySelector("p").textContent = item.Subtitle

        const date = new Date(item.Date);
        cloneData.querySelector(".date").textContent = date.getDate()
        cloneData.querySelector(".month").textContent = "Th"+(date.getMonth() + 1)
        
        // cloneData.querySelector(".rate span").textContent = item.Rate
        // cloneData.querySelector(".hvr-inner a").href = `./?page=movieDetails&id=${item.ID}`

        dataList.appendChild(cloneData)
    });
    // document.querySelector(".shop_sidebar_searchbar input").value = Helper.getParameterByName("search")
    filterBy()
}