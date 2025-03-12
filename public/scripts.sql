--1
CREATE TABLE Containers (
                            ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                            Number INT NOT NULL,
                            Type NVARCHAR(50) NOT NULL,
                            Length DECIMAL(10, 2) NOT NULL,
                            Width DECIMAL(10, 2) NOT NULL,
                            Height DECIMAL(10, 2) NOT NULL,
                            Weight DECIMAL(10, 2) NOT NULL,
                            IsEmpty BIT NOT NULL,
                            ArrivalDate DATETIME NOT NULL
);

CREATE TABLE Operations (
                            ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                            ContainerID UNIQUEIDENTIFIER NOT NULL,
                            StartDate DATETIME NOT NULL,
                            EndDate DATETIME NOT NULL,
                            OperationType NVARCHAR(50) NOT NULL,
                            OperatorName NVARCHAR(100) NOT NULL,
                            InspectionPlace NVARCHAR(100) NOT NULL,
                            FOREIGN KEY (ContainerID) REFERENCES Containers(ID)
);

--2
SELECT
    '{' +
    '"ID": "' + CAST(ID AS NVARCHAR(36)) + '", ' +
    '"Number": ' + CAST(Number AS NVARCHAR) + ', ' +
    '"Type": "' + Type + '", ' +
    '"Length": ' + CAST(Length AS NVARCHAR) + ', ' +
    '"Width": ' + CAST(Width AS NVARCHAR) + ', ' +
    '"Height": ' + CAST(Height AS NVARCHAR) + ', ' +
    '"Weight": ' + CAST(Weight AS NVARCHAR) + ', ' +
    '"IsEmpty": ' + CAST(IsEmpty AS NVARCHAR) + ', ' +
    '"ArrivalDate": "' + CONVERT(NVARCHAR, ArrivalDate, 126) + '"' +
    '}' AS JsonData
FROM
    Containers;

--3
SELECT
    '{' +
    '"ID": "' + CAST(O.ID AS NVARCHAR(36)) + '", ' +
    '"ContainerID": "' + CAST(O.ContainerID AS NVARCHAR(36)) + '", ' +
    '"StartDate": "' + CONVERT(NVARCHAR, O.StartDate, 126) + '", ' +
    '"EndDate": "' + CONVERT(NVARCHAR, O.EndDate, 126) + '", ' +
    '"OperationType": "' + O.OperationType + '", ' +
    '"OperatorName": "' + O.OperatorName + '", ' +
    '"InspectionPlace": "' + O.InspectionPlace + '"' +
    '}' AS JsonData
FROM
    Operations O
        JOIN
    Containers C ON O.ContainerID = C.ID
WHERE
    C.IsEmpty = 0; -- Фильтр для не пустых контейнеров