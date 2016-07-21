# chef-ldap-users
How to handle "can't find user for xxx" error after trying to reference newly added ldap user from earlier in converge

## Synopsis
Have you ever run into this issue:
https://tickets.opscode.com/browse/CHEF-3780

Scenario: node is bootstrapped and during the 1st converge gets added to AD or some ldap OU

Later in the recipe a resource (such as file) is defined wth an owner attribute using an ldap user.

ERROR:
```
ArgumentError
-------------
can't find user for xxx
```


This is because when chef-client began executing it didn't know about the new ldap users.  An Ohai reload doesn't solve the problem either.


The cookbook in here suggests one way to work around this problem and still be able to use the new ldap users
during the first converge.
