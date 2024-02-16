{assign var="title" value=($title|default:"")}
{assign var="image" value=($image|default:"")}

<div class="col-sm-12 col-md-3">
    <div class="card bg-dark text-light text-center">
        <div class="card-body">
            <a href="{$link}" class="text-light">
                <h4 class="card-title">{$title}</h4>
                <img src="{$image}" class="img-fluid" alt="{$title}" style="width: 120px;object-fit:contain;">
                <p class="mt-4">Online form</p>
            </a>

        </div>
    </div>
</div>