CREATE TABLE [students] (
  [student_id] int PRIMARY KEY IDENTITY(1, 1),
  [student_name] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [instructors] (
  [instructor_id] int PRIMARY KEY IDENTITY(1, 1),
  [instructor_name] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [programmes] (
  [programme_id] int PRIMARY KEY IDENTITY(1, 1),
  [programme_name] nvarchar(255)
)
GO

CREATE TABLE [modules] (
  [module_id] int PRIMARY KEY IDENTITY(1, 1),
  [module_name] nvarchar(255),
  [module_credits] int
)
GO

CREATE TABLE [academic_offer] (
  [acYear] int,
  [programme_id] int,
  [module_id] int
)
GO

CREATE TABLE [module_instructors] (
  [acYear] int,
  [module_id] int,
  [instructor_id] int,
  PRIMARY KEY ([acYear], [module_id])
)
GO

CREATE TABLE [student_enrollment] (
  [acYear] int,
  [student_id] int,
  [programme_id] int,
  PRIMARY KEY ([acYear], [student_id])
)
GO

ALTER TABLE [academic_offer] ADD FOREIGN KEY ([programme_id]) REFERENCES [programmes] ([programme_id])
GO

ALTER TABLE [academic_offer] ADD FOREIGN KEY ([module_id]) REFERENCES [modules] ([module_id])
GO

ALTER TABLE [academic_offer] ADD FOREIGN KEY ([acYear], [module_id]) REFERENCES [module_instructors] ([acYear], [module_id])
GO

ALTER TABLE [module_instructors] ADD FOREIGN KEY ([module_id]) REFERENCES [modules] ([module_id])
GO

ALTER TABLE [module_instructors] ADD FOREIGN KEY ([instructor_id]) REFERENCES [instructors] ([instructor_id])
GO

ALTER TABLE [student_enrollment] ADD FOREIGN KEY ([acYear], [programme_id]) REFERENCES [academic_offer] ([acYear], [programme_id])
GO

ALTER TABLE [student_enrollment] ADD FOREIGN KEY ([student_id]) REFERENCES [students] ([student_id])
GO

CREATE INDEX [academic_offer_index_0] ON [academic_offer] ("acYear", "programme_id")
GO

CREATE INDEX [academic_offer_index_1] ON [academic_offer] ("acYear", "module_id")
GO
