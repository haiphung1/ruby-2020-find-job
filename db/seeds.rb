skills = ["html", "java", "css", "ios"]
skills.each{|skill|
  Skill.create!(
    title: skill
  )
}
