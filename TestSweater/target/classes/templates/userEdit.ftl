<#import "parts/commons.ftl" as c>

<@c.page>
    User Editor

    <div class="form-group row">
    <form action="/user" method="post">
        <input type="text" class="form-control" name="username" value="${user.username}"/>
        <#list roles as role>
            <div class="form-group row my-3">
                <label class="col-sm-4 col-form-label">
                    <input type="checkbox" class="form-control" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>${role}
                </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId"/>
        <input type="hidden" value="${_csrf.token}" name="_csrf"/>
        <button type="submit" class="btn btn-primary ml-2">Save</button>
    </form>
    </div>

</@c.page>