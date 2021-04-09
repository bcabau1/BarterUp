function listToGrid() {
    var li_links = document.querySelectorAll(".links ul li");
    var view_wraps = document.querySelectorAll(".view_wrap");

    li_links.forEach(function(link) {
        link.addEventListener("click", function() {
            li_links.forEach(function(item) {
                item.classList.remove("active");
            })
            link.classList.add("active");

            var li_view = link.getAttribute("data-view");

            view_wraps.forEach(function(view) {
                view.style.display = "none";
            })

            if (li_view == "list_view") {
                document.querySelector("." + li_view).style.display = "block";
            } else {
                document.querySelector("." + li_view).style.display = "block";
            }
        })
    })
}