<%@ page import="neu.edu.entity.Post" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <% Post post = (Post) session.getAttribute("primaryPost"); %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post by <%=post.getfrom_name()%></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="css/stylesheet.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container py-3">
    <main class="bg-light rounded shadow p-3 m-3 ">
        <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white">
            <a onclick="toggleOffcanvas(this)" style="cursor: pointer;" data-from-name="<%=post.getfrom_name()%>">
                <div class="card shadow">
                    <div class="card-header">
                        <strong class="mx-auto">
                            <%=post.getfrom_name()%>
                        </strong>
                        <small class="text-muted"><%=post.getDate_time()%>
                        </small>
                    </div>
                    <div class="card-body my-3">
                        <p class="card-text">
                            <%
                                out.append(post.getContent());
                            %>
                        </p>
                    </div>
                </div>
            </a>

            <hr>
            <div class="list-group list-group-flush border-bottom scrollarea">

                <%
                    ArrayList<Post> comments = (ArrayList<Post>) session.getAttribute("comments");
                %>
                <%
                    for (Post comment : comments) {
                %>

                <a class="list-group-item list-group-item-action mx-auto" onclick="toggleOffcanvas(this)"
                   data-from-name="<%=comment.getfrom_name()%>">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <div>
                            <strong class="mb-1">
                                <%=comment.getfrom_name()%>
                            </strong>
                            >
                            <strong>
                                <%=comment.getto_name()%>
                            </strong>
                        </div>

                        <small class="text-muted"><%=comment.getDate_time()%>
                        </small>
                    </div>
                    <div class="col-10 mb-1 small">
                        <%=comment.getContent()%>

                    </div>
                </a>
                <%
                    }
                %>
            </div>
        </div>
    </main>
    <div style="height: 50px;"></div>
</div>


<div class="offcanvas offcanvas-bottom rounded w-75" style="left: 12.5%;" tabindex="-1" id="offcanvasBottom"
     aria-labelledby="offcanvasBottomLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasBottomLabel">
        </h5>

        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body small">
        <form class="needs-validation"
              action="comment?father_id=<%=post.getId()%>&from_name=<%=(String) session.getAttribute("loginUsername")%>"
              id="commentForm" method="post" novalidate>
            <div class="mb-3">
                <label for="Textarea" class="form-label">Input Your Comment:</label>
                <textarea class="form-control" name="content" id="Textarea" rows="5" required></textarea>
                <div class="invalid-feedback">
                    Cannot submit empty post!
                </div>
            </div>
            <div class="container-fluid text-end">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>
<a href="post" class="btn-close go-back"></a>
<div class="go-top">
    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-caret-up-fill"
         viewBox="0 0 16 16">
        <path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
    </svg>
</div>
<script>
    let to_name = "";

    function toggleOffcanvas(a) {
        const offcanvas = document.getElementById('offcanvasBottom');
        const bsOffcanvas = new bootstrap.Offcanvas(offcanvas);
        to_name = a.getAttribute("data-from-name");
        document.getElementById("offcanvasBottomLabel").innerHTML="Reply to: "+to_name;
        bsOffcanvas.toggle();
    }

    $(function () {

        //Scroll event
        $(window).scroll(function () {
            var scrolled = $(window).scrollTop();
            if (scrolled > 200) $('.go-top').fadeIn('slow');
            if (scrolled < 200) $('.go-top').fadeOut('slow');
        });

        //Click event
        $('.go-top').click(function () {
            $("html, body").animate({scrollTop: "0"}, 500);
        });

    });

</script>
<script>
    const form = document.getElementById("commentForm");
    form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        } else {
            let actionUrl = form.getAttribute("action");
            actionUrl += "&to_name=" + to_name;
            form.setAttribute("action", actionUrl);
            console.log("submit successfully!");
        }
        form.classList.add('was-validated');
    }, false)
</script>
</body>
</html>