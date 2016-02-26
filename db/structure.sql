CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "admins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "password" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "instructors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "password" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "password" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "courseNumber" varchar, "title" varchar, "description" varchar, "startDate" date, "endDate" date, "status" varchar, "instructor_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "enrollments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "status" varchar, "student_id" integer, "course_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "grade" varchar);
CREATE TABLE "grades" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "grade" varchar, "student_id" integer, "course_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "course_materials" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "message" varchar, "course_id" integer, "instructor_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "message" varchar, "course_id" integer, "instructor_id" integer, "student_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "email_notifications" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "course_id" integer, "student_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20160130213802');

INSERT INTO schema_migrations (version) VALUES ('20160131203534');

INSERT INTO schema_migrations (version) VALUES ('20160131203800');

INSERT INTO schema_migrations (version) VALUES ('20160131204558');

INSERT INTO schema_migrations (version) VALUES ('20160131212058');

INSERT INTO schema_migrations (version) VALUES ('20160131213016');

INSERT INTO schema_migrations (version) VALUES ('20160215004416');

INSERT INTO schema_migrations (version) VALUES ('20160215221149');

INSERT INTO schema_migrations (version) VALUES ('20160219031106');

INSERT INTO schema_migrations (version) VALUES ('20160225173215');

