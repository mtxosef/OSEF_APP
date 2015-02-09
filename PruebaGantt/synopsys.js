Ext.onReady(function () {

    var taskStore = Ext.create('Gnt.data.TaskStore', {
        autoLoad: true,
        proxy: {
            type: 'memory',
            reader: {
                type: 'json'
            },

            data: [
                {
                    "StartDate": "2010-01-18",
                    "EndDate": "2010-02-02",
                    "Id": 1,
                    "Name": "Planning",
                    "expanded": true,
                    "children": [
                        {
                            "StartDate": "2010-01-18",
                            "EndDate": "2010-01-26",
                            "Id": 2,
                            "leaf": true,
                            "Name": "Investigate",
                            "parentId": 1
                        },
                        {
                            "StartDate": "2010-01-22",
                            "EndDate": "2010-01-25",
                            "Id": 3,
                            "leaf": true,
                            "Name": "Investigate2",
                            "parentId": 1
                        },
                        {
                            "StartDate": "2010-01-28",
                            "EndDate": "2010-01-28",
                            "Id": 4,
                            "leaf": true,
                            "Name": "Investigate3",
                            "parentId": 1
                        }
                    ]
                }
            ]
            // eof data
        }
        // eof proxy
    });

    var ganttPanel = Ext.create('Gnt.panel.Gantt', {
        height: 400,
        width: 1000,

        viewPreset: 'weekAndDayLetter',

        startDate: new Date(2010, 0, 15),
        endDate: Sch.util.Date.add(new Date(2010, 0, 15), Sch.util.Date.WEEK, 3),

        columns: [
            {
                xtype: 'treecolumn',
                header: 'Tasks',
                sortable: false,
                dataIndex: 'Name',
                width: 200
            }
        ],

        taskStore: taskStore
    });

    ganttPanel.render(Ext.getBody());
});