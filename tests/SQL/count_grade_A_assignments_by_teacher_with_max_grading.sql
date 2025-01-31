-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH TeacherGradingCount AS (
    SELECT
        teacher_id,
        COUNT(*) AS total_graded
    FROM
        assignments
    WHERE
        grade IS NOT NULL
    GROUP BY
        teacher_id
),
MaxGradingTeacher AS (
    SELECT
        teacher_id
    FROM
        TeacherGradingCount
    ORDER BY
        total_graded DESC
    LIMIT 1
)
SELECT
    COUNT(*) AS grade_a_count
FROM
    assignments
WHERE
    grade = 'A'
    AND teacher_id = (SELECT teacher_id FROM MaxGradingTeacher);