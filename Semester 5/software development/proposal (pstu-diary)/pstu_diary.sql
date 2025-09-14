CREATE TABLE `academy_blooddonor` (
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `st_id` int NOT NULL,
  `st_reg` int NOT NULL,
  `blood_group` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `faculty` varchar(19) COLLATE utf8mb4_general_ci NOT NULL,
  `session` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `academy_deanfaculty` (
  `id` bigint NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `academy_deanoffice` (
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `priority` int NOT NULL,
  `department_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `academy_department` (
  `id` bigint NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `academy_staff` (
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `designation` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `priority` int NOT NULL,
  `department_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `academy_staffdepartment` (
  `id` bigint NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `academy_studentcr` (
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `priority` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `academy_teacher` (
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_pic` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `faculty_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `priority` int NOT NULL,
  `department_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `administration_administration` (
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `faculty_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `priority` int NOT NULL,
  `department_id` bigint NOT NULL,
  `profile_pic` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `administration_administrationdepartment` (
  `id` bigint NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `administration_servicedepartment` (
  `id` bigint NOT NULL,
  `faculty_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `administration_services` (
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` int NOT NULL,
  `department_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `course_course` (
  `id` bigint NOT NULL,
  `course_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `course_code` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `credit_hour` decimal(5,2) NOT NULL,
  `faculty` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

