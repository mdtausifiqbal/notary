<div class="breadcrumb-bar">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-md-12 col-12">
                <nav aria-label="breadcrumb" class="page-breadcrumb">
                    <ol class="breadcrumb">
                        {foreach from=$breadcrumbs item=breadcrumb}
                            {assign var="isActive" value=$breadcrumb.url == ""}
                            <li class="breadcrumb-item {if $isActive}active" aria-current="page{/if}">
                                {if isset($breadcrumb.url) && $breadcrumb.url != ''}
                                    <a href="{$breadcrumb.url}">{$breadcrumb.name}</a>
                                {else} {$breadcrumb.name}
                                {/if}
                            </li>
                        {/foreach}
                    </ol>
                </nav>
                <h2 class="breadcrumb-title">{$breadcrumbTitle}</h2>
                <p class="breadcrumb-description">{$breadcrumbDescription}</p>

            </div>
        </div>
    </div>
</div>