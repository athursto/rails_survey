Survey.destroy_all

survey = Survey.create!(title: "Sample Health Survey")

section1 = survey.sections.create!(title: "Education", position: 1)
section2 = survey.sections.create!(title: "Health and Wellness", position: 2)
section3 = survey.sections.create!(title: "Follow Up", position: 3)
section4 = survey.sections.create!(title: "Housing", position: 4)

level_education_question = section1.questions.create!(
  content: "What is the last grade you finished in school?",
  question_type: Question.question_types[:multiple_choice],
  options_attributes: [
    { content: "No High School" },
    { content: "Some High School" },
    { content: "High School Graduate" },
    { content: "GED or High School equivalency" },
    { content: "I choose not to answer" }
  ]
)

return_to_school_question = section1.questions.create!(
  content: "Do you ever want to go back to school?",
  question_type: Question.question_types[:multiple_choice],
  options_attributes: [
    { content: "Yes" },
    { content: "No" }
  ]
)

material_security_question = section2.questions.create!(
  content: "It can be stressful to pay your bills. Over the past year, have you had trouble getting food for you or your family regularly?",
  question_type: Question.question_types[:multiple_choice],
  options_attributes: [
    { content: "Yes" },
    { content: "No" },
    { content: "I choose not to answer" }
  ]
)

security_resource = section3.questions.create!(
  content: "We can provide support via counseling. Contact us at 867-123-4567",
  question_type: Question.question_types[:info]
)

housing_question = section4.questions.create!(
  content: "Can you tell me about your housing today?",
  question_type: Question.question_types[:text]
)

# adding in some branching rules
BranchingRule.create!(question: material_security_question, answer: "Yes", next_section: section3)
BranchingRule.create!(question: material_security_question, answer: "No", next_section: section4)
BranchingRule.create!(question: material_security_question, answer: "I choose not to answer", next_section: section4)
puts "Seeding complete!"
