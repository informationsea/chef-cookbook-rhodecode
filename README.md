rhodecode Cookbook
==================
Install and configure Rhodecode

Requirements
------------

#### packages
- `python` - [Python Cookbook](http://community.opscode.com/cookbooks/python)

Attributes
----------
#### rhodecode::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rhodecode']['user']</tt></td>
    <td>String</td>
    <td>Unix user name to install</td>
    <td><tt>rhodecode</tt></td>
  </tr>
  <tr>
    <td><tt>['rhodecode']['admin_user']</tt></td>
    <td>String</td>
    <td>Administrator user name of rhodecode</td>
    <td><tt>admin</tt></td>
  </tr>
  <tr>
    <td><tt>['rhodecode']['admin_email']</tt></td>
    <td>String</td>
    <td>Administrator e-mail address of rhodecode</td>
    <td><tt>rhodecode</tt></td>
  </tr>
  <tr>
    <td><tt>['rhodecode']['admin_password']</tt></td>
    <td>String</td>
    <td>Administrator password of rhodecode</td>
    <td><tt>ADMIN-PASSWORD</tt></td>
  </tr>
</table>

Usage
-----
#### rhodecode::default
Just include `rhodecode` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rhodecode]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: OKAMURA Yasunobu (okamura@informationsea.info)
