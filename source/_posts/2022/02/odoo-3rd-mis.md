---
title: odoo第三方报表模块MIS
typora-copy-images-to: odoo-3rd-mis
typora-root-url: odoo-3rd-mis
date: 2022-02-13 10:27:18
tags:
  - Odoo模块
category:
  - Odoo
---



# MIS Builder 模块介绍

https://github.com/OCA/mis-builder

Management Information System reports for Odoo: easily build super fast, beautiful, custom reports such as P&L, Balance Sheets and more.

**This is the 14.0 branch. Please note the development of new features occurs mainly on the 10.0 branch, to be forward-ported to 14.0. Please submit pull requests to the 10.0 branch in priority, unless they are 14.0 specific bugs, or they rely on Odoo features that are not present in 10.0.**

This project implements a class of reports where KPI (Key Performance Indicators) are displayed in rows, and time periods in columns. It focuses on very fast reporting on accounting data but can also use data from any other Odoo model.

It features the following key characteristics:

* User configurable: end users can create new report templates without development, using simple Excel-like formulas.
* Very fast balance reporting for accounting data, even on million lines databases and very complex account charts.
* Use the same template for different reports.
* Compare data over different time periods.
* User-configurable styles, rendered perfectly in the UI as well as Excel and PDF exports.
* Interactive display with drill-down.
* Export to PDF and Excel.
* A budgeting module.
* Evaluate KPI over various data sources, such as actuals, simulation, committed costs (some custom development is required to create the data source).
* For developers, the accounting balance computation engine is exposed as an easy to use API.

# 安装

## 查找依赖

查看MIS模块的的__manifest__.py文件

```python
# Copyright 2014-2018 ACSONE SA/NV (<http://acsone.eu>)
# License AGPL-3.0 or later (https://www.gnu.org/licenses/agpl.html).

{
    "name": "MIS Builder",
    "version": "14.0.4.0.0",
    "category": "Reporting",
    "summary": """
        Build 'Management Information System' Reports and Dashboards
    """,
    "author": "ACSONE SA/NV, " "Odoo Community Association (OCA)",
    "website": "https://github.com/OCA/mis-builder",
    "depends": [
        "account",
        "board",
        "report_xlsx",  # OCA/reporting-engine
        "date_range",  # OCA/server-ux
    ],
    "data": [
        "wizard/mis_builder_dashboard.xml",
        "views/mis_report.xml",
        "views/mis_report_instance.xml",
        "views/mis_report_style.xml",
        "datas/ir_cron.xml",
        "security/ir.model.access.csv",
        "security/mis_builder_security.xml",
        "report/mis_report_instance_qweb.xml",
        "report/mis_report_instance_xlsx.xml",
    ],
    "qweb": ["static/src/xml/mis_report_widget.xml"],
    "installable": True,
    "application": True,
    "license": "AGPL-3",
    "development_status": "Production/Stable",
    "maintainers": ["sbidoul"],
}

```

得知：

* [OCA/reporting-engine](https://github.com/OCA/reporting-engine)   中的 [report_xlsx](https://github.com/OCA/reporting-engine/tree/14.0/report_xlsx)

* [OCA/server-ux](https://github.com/OCA/server-ux)  中的[date_range](https://github.com/OCA/server-ux/tree/14.0/date_range)



## 安装模块

1. 下载并添加到第三方模块路径

2. 启用开发者模式，刷新本地模块列表

![image-20220213105655976](image-20220213105655976.png)

![image-20220213105735531](image-20220213105735531.png)

3. 安装

![image-20220213105813161](image-20220213105813161.png)

## 验证安装

accounting->reporting->MIS reports

![image-20220213110005635](image-20220213110005635.png)

![image-20220213110149690](image-20220213110149690.png)
