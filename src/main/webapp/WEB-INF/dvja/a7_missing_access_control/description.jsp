<div class="markdown">
Applications do not always protect application functions properly. Sometimes, function level protection is managed via configuration, and the system is misconfigured.

**Example Scenario**

The attacker simply force browses to target URLs. The following URLs require authentication. Admin rights are also required for access to the `admin_getappInfo` page.

```
http://example.com/app/getappInfo
http://example.com/app/admin_getappInfo
```

If an unauthenticated user can access either page, then it is a security flaw. If an authenticated, non-admin, user is allowed to access the `admin_getappInfo` page, this is also a flaw, and may lead the attacker to more improperly protected admin pages.
</div>