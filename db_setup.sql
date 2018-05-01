-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `crn` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `week` int(11) NOT NULL,
  `studid` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `loginid` int(11) NOT NULL,
  `record_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `capabilities`
--

CREATE TABLE `capabilities` (
  `capability_id` int(11) NOT NULL,
  `capability_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `capabilities`
--

INSERT INTO `capabilities` (`capability_id`, `capability_description`) VALUES
(1, 'View SOBS'),
(2, 'Manage SOBs'),
(3, 'Observe SOBs'),
(4, 'Manage Staffs'),
(5, 'Manage Students'),
(6, 'Attendance'),
(7, 'Kits');

-- --------------------------------------------------------

--
-- Table structure for table `capability_mapping`
--

CREATE TABLE `capability_mapping` (
  `mapping_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `capability_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `capability_mapping`
--

INSERT INTO `capability_mapping` (`mapping_id`, `staff_id`, `capability_id`) VALUES
(89, 1, 1),
(90, 1, 2),
(91, 1, 3),
(92, 1, 4),
(93, 1, 5),
(94, 1, 6),
(95, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `contact_thread`
--

CREATE TABLE `contact_thread` (
  `thread_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `thread_subject` text NOT NULL,
  `thread_message` text NOT NULL,
  `thread_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_thread_replies`
--

CREATE TABLE `contact_thread_replies` (
  `replied_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `replied_by` int(11) NOT NULL,
  `replied_message` text NOT NULL,
  `replied_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CRNlist`
--

CREATE TABLE `CRNlist` (
  `crn_id` int(11) NOT NULL,
  `crn` int(11) NOT NULL,
  `oldcrn` bigint(20) NOT NULL,
  `codetype` text NOT NULL,
  `day` text NOT NULL,
  `room` text NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CRNlist_tmp`
--

CREATE TABLE `CRNlist_tmp` (
  `crn_id` int(11) NOT NULL,
  `crn` int(11) NOT NULL,
  `codetype` text NOT NULL,
  `day` text NOT NULL,
  `room` text NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keywords_sobs`
--

CREATE TABLE `keywords_sobs` (
  `tag_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `sob_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kits`
--

CREATE TABLE `kits` (
  `kit_id` bigint(20) NOT NULL,
  `kit_asset_tag` text NOT NULL,
  `kit_type_id` bigint(20) NOT NULL,
  `kit_status_id` bigint(20) NOT NULL,
  `kit_notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kit_loans`
--

CREATE TABLE `kit_loans` (
  `kit_loan_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `kit_id` bigint(20) NOT NULL,
  `kit_due_at` datetime NOT NULL,
  `kit_checked_out_at` datetime NOT NULL,
  `kit_checked_out_by` bigint(20) NOT NULL,
  `kit_checked_in_at` datetime DEFAULT NULL,
  `kit_checked_in_by` bigint(20) DEFAULT NULL,
  `kit_returned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kit_status`
--

CREATE TABLE `kit_status` (
  `kit_status_id` bigint(20) NOT NULL,
  `kit_status_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kit_status`
--

INSERT INTO `kit_status` (`kit_status_id`, `kit_status_name`) VALUES
(1, 'In Stock'),
(2, 'On Loan'),
(3, 'Overdue');

-- --------------------------------------------------------

--
-- Table structure for table `kit_type`
--

CREATE TABLE `kit_type` (
  `kit_type_id` bigint(20) NOT NULL,
  `kit_type_name` text NOT NULL,
  `kit_type_description` text NOT NULL,
  `kit_type_default_loan_duration_length` bigint(20) NOT NULL,
  `kit_type_default_loan_duration_unit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `level_id` bigint(20) NOT NULL,
  `level` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`level_id`, `level`) VALUES
(1, 'Threshold'),
(2, 'Typical'),
(3, 'Excellent');

-- --------------------------------------------------------

--
-- Table structure for table `moodle_imported_students`
--

CREATE TABLE `moodle_imported_students` (
  `student_id` bigint(20) NOT NULL,
  `student_name` text NOT NULL,
  `student_number` text NOT NULL,
  `student_email` text NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` bigint(20) NOT NULL,
  `setting_name` text NOT NULL,
  `setting_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `setting_name`, `setting_value`) VALUES
(1, 'LDAP_login', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sobs`
--

CREATE TABLE `sobs` (
  `sob_id` bigint(20) NOT NULL,
  `sob` text NOT NULL,
  `url` text NOT NULL,
  `level_id` bigint(20) NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `expected_start_date` date NOT NULL,
  `expected_completion_date` date NOT NULL,
  `sob_notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sob_discussion`
--

CREATE TABLE `sob_discussion` (
  `discussion_id` bigint(20) NOT NULL,
  `sob_id` bigint(20) NOT NULL,
  `user_type` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `discussion_note` text NOT NULL,
  `discussion_datetime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sob_notes`
--

CREATE TABLE `sob_notes` (
  `note_id` bigint(20) NOT NULL,
  `sob_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `note` text NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `public` int(11) NOT NULL,
  `comment_by` int(11) NOT NULL COMMENT '0 - Staff, 1 - Student',
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sob_observations`
--

CREATE TABLE `sob_observations` (
  `observation_id` bigint(20) NOT NULL,
  `sob_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `observed_on` date NOT NULL,
  `observation_notes` text NOT NULL,
  `observed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sob_observations_log`
--

CREATE TABLE `sob_observations_log` (
  `log_id` bigint(20) NOT NULL,
  `undo_by` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `sob_id` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` bigint(20) NOT NULL,
  `network_name` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `password` text NOT NULL,
  `enc_id` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staff_id`, `network_name`, `firstname`, `lastname`, `password`, `enc_id`, `email`) VALUES
(1, 'staffdemo', 'StaffName', 'StaffSurname', '', 'C142FB215B6E05B7C134B1A653AD4B455157FD79', 'CHANGEME@EXAMPLE.COM');

-- --------------------------------------------------------

--
-- Table structure for table `staff_timetable`
--

CREATE TABLE `staff_timetable` (
  `association_id` int(11) NOT NULL,
  `crn` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `network_name` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `student_number` text NOT NULL,
  `student_status` int(11) NOT NULL COMMENT '0 - Active, 1 - Inactive',
  `enc_id` text NOT NULL,
  `last_login` datetime NOT NULL,
  `last_activity` datetime NOT NULL,
  `visa` tinyint(1) NOT NULL DEFAULT '0',
  `foundation` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students_note`
--

CREATE TABLE `students_note` (
  `note_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `note_text` text NOT NULL,
  `note_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_timetable`
--

CREATE TABLE `student_timetable` (
  `session_id` int(11) NOT NULL,
  `crn` bigint(20) NOT NULL,
  `student_number` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_timetable_tmp`
--

CREATE TABLE `student_timetable_tmp` (
  `session_id` int(11) NOT NULL,
  `crn` bigint(20) NOT NULL,
  `student_number` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` bigint(20) NOT NULL,
  `topic` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic`) VALUES
(1, 'Programming'),
(2, 'Maths'),
(3, 'Hardware'),
(4, 'Topic 4'),
(5, 'Topic 5');

-- --------------------------------------------------------

--
-- Table structure for table `validate_sessions`
--

CREATE TABLE `validate_sessions` (
  `log_id` int(11) NOT NULL,
  `session_id` text NOT NULL COMMENT 'PHP SESSION ID',
  `user_logged_enc` text NOT NULL COMMENT 'staff enc_id or student enc_id',
  `user_type` int(11) NOT NULL COMMENT '1 - Staff 2 - Student ',
  `user_logged_id` bigint(20) NOT NULL,
  `user_name` text NOT NULL,
  `user_email` text NOT NULL,
  `user_ip` text NOT NULL,
  `last_activity` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `week`
--

CREATE TABLE `week` (
  `week_id` int(11) NOT NULL,
  `week_start` date NOT NULL,
  `week_end` date NOT NULL,
  `week_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `week`
--

INSERT INTO `week` (`week_id`, `week_start`, `week_end`, `week_number`) VALUES
(1, '2016-10-03', '2016-10-07', 1),
(2, '2016-10-10', '2016-10-14', 2),
(3, '2016-10-17', '2016-10-21', 3),
(4, '2016-10-24', '2016-10-28', 4),
(5, '2016-10-31', '2016-11-04', 5),
(6, '2016-11-07', '2016-11-11', 6),
(7, '2016-11-14', '2016-11-18', 7),
(8, '2016-11-21', '2016-11-25', 8),
(9, '2016-11-28', '2016-12-02', 9),
(10, '2016-12-05', '2016-12-09', 10),
(11, '2016-12-12', '2016-12-16', 11),
(12, '2016-01-11', '2016-01-15', 12),
(13, '2016-01-18', '2016-01-22', 13),
(14, '2016-01-25', '2016-01-29', 14),
(15, '2016-02-01', '2016-02-05', 15),
(16, '2016-02-08', '2016-02-12', 16),
(17, '2016-02-15', '2016-02-19', 17),
(18, '2016-02-22', '2016-02-26', 18),
(19, '2016-02-29', '2016-03-04', 19),
(20, '2016-03-07', '2016-03-11', 20),
(21, '2016-03-14', '2016-03-18', 21),
(22, '2016-03-21', '2016-03-25', 22),
(23, '2016-04-11', '2016-04-15', 23),
(24, '2016-04-18', '2016-04-22', 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `capabilities`
--
ALTER TABLE `capabilities`
  ADD PRIMARY KEY (`capability_id`);

--
-- Indexes for table `capability_mapping`
--
ALTER TABLE `capability_mapping`
  ADD PRIMARY KEY (`mapping_id`);

--
-- Indexes for table `contact_thread`
--
ALTER TABLE `contact_thread`
  ADD PRIMARY KEY (`thread_id`);

--
-- Indexes for table `contact_thread_replies`
--
ALTER TABLE `contact_thread_replies`
  ADD PRIMARY KEY (`replied_id`);

--
-- Indexes for table `CRNlist`
--
ALTER TABLE `CRNlist`
  ADD PRIMARY KEY (`crn_id`);

--
-- Indexes for table `CRNlist_tmp`
--
ALTER TABLE `CRNlist_tmp`
  ADD PRIMARY KEY (`crn_id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indexes for table `keywords_sobs`
--
ALTER TABLE `keywords_sobs`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`kit_id`);

--
-- Indexes for table `kit_loans`
--
ALTER TABLE `kit_loans`
  ADD PRIMARY KEY (`kit_loan_id`);

--
-- Indexes for table `kit_status`
--
ALTER TABLE `kit_status`
  ADD PRIMARY KEY (`kit_status_id`);

--
-- Indexes for table `kit_type`
--
ALTER TABLE `kit_type`
  ADD PRIMARY KEY (`kit_type_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `moodle_imported_students`
--
ALTER TABLE `moodle_imported_students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sobs`
--
ALTER TABLE `sobs`
  ADD PRIMARY KEY (`sob_id`);

--
-- Indexes for table `sob_discussion`
--
ALTER TABLE `sob_discussion`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Indexes for table `sob_notes`
--
ALTER TABLE `sob_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `sob_observations`
--
ALTER TABLE `sob_observations`
  ADD PRIMARY KEY (`observation_id`),
  ADD KEY `idx_sob_observation_student_id` (`student_id`),
  ADD KEY `idx_sob_observation_observed_on` (`observed_on`),
  ADD KEY `idx_sob_observation_son_id` (`sob_id`);

--
-- Indexes for table `sob_observations_log`
--
ALTER TABLE `sob_observations_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `staff_timetable`
--
ALTER TABLE `staff_timetable`
  ADD PRIMARY KEY (`association_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `students_note`
--
ALTER TABLE `students_note`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `student_timetable`
--
ALTER TABLE `student_timetable`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `student_timetable_tmp`
--
ALTER TABLE `student_timetable_tmp`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `validate_sessions`
--
ALTER TABLE `validate_sessions`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `week`
--
ALTER TABLE `week`
  ADD PRIMARY KEY (`week_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `capabilities`
--
ALTER TABLE `capabilities`
  MODIFY `capability_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `capability_mapping`
--
ALTER TABLE `capability_mapping`
  MODIFY `mapping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `contact_thread`
--
ALTER TABLE `contact_thread`
  MODIFY `thread_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_thread_replies`
--
ALTER TABLE `contact_thread_replies`
  MODIFY `replied_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CRNlist`
--
ALTER TABLE `CRNlist`
  MODIFY `crn_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CRNlist_tmp`
--
ALTER TABLE `CRNlist_tmp`
  MODIFY `crn_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keywords_sobs`
--
ALTER TABLE `keywords_sobs`
  MODIFY `tag_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kits`
--
ALTER TABLE `kits`
  MODIFY `kit_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kit_loans`
--
ALTER TABLE `kit_loans`
  MODIFY `kit_loan_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kit_status`
--
ALTER TABLE `kit_status`
  MODIFY `kit_status_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kit_type`
--
ALTER TABLE `kit_type`
  MODIFY `kit_type_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `level_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `moodle_imported_students`
--
ALTER TABLE `moodle_imported_students`
  MODIFY `student_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sobs`
--
ALTER TABLE `sobs`
  MODIFY `sob_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sob_discussion`
--
ALTER TABLE `sob_discussion`
  MODIFY `discussion_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sob_notes`
--
ALTER TABLE `sob_notes`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sob_observations`
--
ALTER TABLE `sob_observations`
  MODIFY `observation_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sob_observations_log`
--
ALTER TABLE `sob_observations_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `staff_timetable`
--
ALTER TABLE `staff_timetable`
  MODIFY `association_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students_note`
--
ALTER TABLE `students_note`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_timetable`
--
ALTER TABLE `student_timetable`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_timetable_tmp`
--
ALTER TABLE `student_timetable_tmp`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `validate_sessions`
--
ALTER TABLE `validate_sessions`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `week`
--
ALTER TABLE `week`
  MODIFY `week_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;