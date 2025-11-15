1.Select id, left(Name,charindex(',', name)-1) as Name,
right(Name,len(name)-(charindex(',', name))) as Surname
from TestMultipleColumns.
