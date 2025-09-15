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


--
-- Constraints for table `academy_deanoffice`
--
ALTER TABLE `academy_deanoffice`
  ADD CONSTRAINT `academy_deanoffice_department_id_ea381d2c_fk_academy_d` FOREIGN KEY (`department_id`) REFERENCES `academy_deanfaculty` (`id`);

--
-- Constraints for table `academy_staff`
--
ALTER TABLE `academy_staff`
  ADD CONSTRAINT `academy_staff_department_id_0e45780b_fk_academy_s` FOREIGN KEY (`department_id`) REFERENCES `academy_staffdepartment` (`id`);

--
-- Constraints for table `administration_administration`
--
ALTER TABLE `administration_administration`
  ADD CONSTRAINT `administration_admin_department_id_fc0992f4_fk_administr` FOREIGN KEY (`department_id`) REFERENCES `administration_administrationdepartment` (`id`);

--
-- Constraints for table `administration_services`
--
ALTER TABLE `administration_services`
  ADD CONSTRAINT `administration_servi_department_id_80d0a933_fk_administr` FOREIGN KEY (`department_id`) REFERENCES `administration_servicedepartment` (`id`);
