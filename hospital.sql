-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 12 2023 г., 12:06
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hospital`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appointments`
--

CREATE TABLE `appointments` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `examination_result_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bills`
--

CREATE TABLE `bills` (
  `id` int NOT NULL,
  `examination_result_id` int NOT NULL,
  `bill_date` date NOT NULL,
  `bill_amount` decimal(10,2) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `head_doctor` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `discharges`
--

CREATE TABLE `discharges` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `discharge_date` date NOT NULL,
  `discharge_recommendations` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `specialty_id` int NOT NULL,
  `department_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `office_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `drugs`
--

CREATE TABLE `drugs` (
  `id` int NOT NULL,
  `drug_name` varchar(255) NOT NULL,
  `drug_description` text,
  `bill_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `drug_prescriptions`
--

CREATE TABLE `drug_prescriptions` (
  `id` int NOT NULL,
  `drug_id` int NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `examination_result_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `examinations`
--

CREATE TABLE `examinations` (
  `id` int NOT NULL,
  `examination_name` varchar(255) NOT NULL,
  `examination_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `examination_results`
--

CREATE TABLE `examination_results` (
  `id` int NOT NULL,
  `examination_id` int NOT NULL,
  `examination_results` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `medical_card`
--

CREATE TABLE `medical_card` (
  `id` int NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `record_date` date NOT NULL,
  `medical_record` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nurses`
--

CREATE TABLE `nurses` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `department_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `offices`
--

CREATE TABLE `offices` (
  `id` int NOT NULL,
  `office_number` int NOT NULL,
  `department_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `card_id` int NOT NULL,
  `ward_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `procedures`
--

CREATE TABLE `procedures` (
  `id` int NOT NULL,
  `procedure_name` varchar(255) NOT NULL,
  `procedure_description` text,
  `bill_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `procedure_prescriptions`
--

CREATE TABLE `procedure_prescriptions` (
  `id` int NOT NULL,
  `procedure_id` int NOT NULL,
  `procedure_date_time` datetime NOT NULL,
  `examination_result_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `procedure_schedule`
--

CREATE TABLE `procedure_schedule` (
  `id` int NOT NULL,
  `procedure_id` int NOT NULL,
  `procedure_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `id` int NOT NULL,
  `working_hours` time NOT NULL,
  `schedule` text NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `specialties`
--

CREATE TABLE `specialties` (
  `id` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wards`
--

CREATE TABLE `wards` (
  `id` int NOT NULL,
  `department_id` int NOT NULL,
  `number_of_beds` int DEFAULT NULL,
  `nurse_id` int NOT NULL
) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `examination_result_id` (`examination_result_id`);

--
-- Индексы таблицы `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examination_result_id` (`examination_result_id`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Индексы таблицы `discharges`
--
ALTER TABLE `discharges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialty_id` (`specialty_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Индексы таблицы `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drug_name` (`drug_name`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Индексы таблицы `drug_prescriptions`
--
ALTER TABLE `drug_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `examination_result_id` (`examination_result_id`);

--
-- Индексы таблицы `examinations`
--
ALTER TABLE `examinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `examination_name` (`examination_name`);

--
-- Индексы таблицы `examination_results`
--
ALTER TABLE `examination_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examination_id` (`examination_id`);

--
-- Индексы таблицы `medical_card`
--
ALTER TABLE `medical_card`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Индексы таблицы `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `office_number` (`office_number`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`),
  ADD KEY `ward_id` (`ward_id`);

--
-- Индексы таблицы `procedures`
--
ALTER TABLE `procedures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `procedure_name` (`procedure_name`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Индексы таблицы `procedure_prescriptions`
--
ALTER TABLE `procedure_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procedure_id` (`procedure_id`),
  ADD KEY `examination_result_id` (`examination_result_id`);

--
-- Индексы таблицы `procedure_schedule`
--
ALTER TABLE `procedure_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procedure_id` (`procedure_id`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `nurse_id` (`nurse_id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  ADD CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`examination_result_id`) REFERENCES `examination_results` (`id`);

--
-- Ограничения внешнего ключа таблицы `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`examination_result_id`) REFERENCES `examination_results` (`id`);

--
-- Ограничения внешнего ключа таблицы `discharges`
--
ALTER TABLE `discharges`
  ADD CONSTRAINT `discharges_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Ограничения внешнего ключа таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`),
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `doctors_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  ADD CONSTRAINT `doctors_ibfk_4` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`);

--
-- Ограничения внешнего ключа таблицы `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`);

--
-- Ограничения внешнего ключа таблицы `drug_prescriptions`
--
ALTER TABLE `drug_prescriptions`
  ADD CONSTRAINT `drug_prescriptions_ibfk_1` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  ADD CONSTRAINT `drug_prescriptions_ibfk_2` FOREIGN KEY (`examination_result_id`) REFERENCES `examination_results` (`id`);

--
-- Ограничения внешнего ключа таблицы `examination_results`
--
ALTER TABLE `examination_results`
  ADD CONSTRAINT `examination_results_ibfk_1` FOREIGN KEY (`examination_id`) REFERENCES `examinations` (`id`);

--
-- Ограничения внешнего ключа таблицы `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Ограничения внешнего ключа таблицы `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Ограничения внешнего ключа таблицы `offices`
--
ALTER TABLE `offices`
  ADD CONSTRAINT `offices_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Ограничения внешнего ключа таблицы `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `medical_card` (`id`),
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`id`);

--
-- Ограничения внешнего ключа таблицы `procedures`
--
ALTER TABLE `procedures`
  ADD CONSTRAINT `procedures_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`);

--
-- Ограничения внешнего ключа таблицы `procedure_prescriptions`
--
ALTER TABLE `procedure_prescriptions`
  ADD CONSTRAINT `procedure_prescriptions_ibfk_1` FOREIGN KEY (`procedure_id`) REFERENCES `procedures` (`id`),
  ADD CONSTRAINT `procedure_prescriptions_ibfk_2` FOREIGN KEY (`examination_result_id`) REFERENCES `examination_results` (`id`);

--
-- Ограничения внешнего ключа таблицы `procedure_schedule`
--
ALTER TABLE `procedure_schedule`
  ADD CONSTRAINT `procedure_schedule_ibfk_1` FOREIGN KEY (`procedure_id`) REFERENCES `procedures` (`id`);

--
-- Ограничения внешнего ключа таблицы `wards`
--
ALTER TABLE `wards`
  ADD CONSTRAINT `wards_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `wards_ibfk_2` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
