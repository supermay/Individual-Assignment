Evaluation.destroy_all
Student.destroy_all
Batch.destroy_all
User.destroy_all

user = User.create!({email: "covfefe@gmail.com", password: "covfefe"})

batch1 = Batch.create!({number:"1", start_at: "08/01/2017", end_at: "08/31/2017", user: user})
batch2 = Batch.create!({number:"2", start_at: "09/01/2017", end_at: "09/30/2017", user: user})

student1 = Student.create!({first_name:"Coka",last_name:"Cola",picture:"https://www.cocacola.nl/content/dam/GO/CokeZone/Common/global/logo/logodesktop/coca-cola-logo-260x260.png", batch: batch1})
student2 = Student.create!({first_name:"Heine",last_name:"Ken",picture:"https://seeklogo.com/images/H/heineken-logo-C4F7E290E9-seeklogo.com.png", batch: batch1})
student3 = Student.create!({first_name:"Fan",last_name:"Ta",picture:"http://vignette3.wikia.nocookie.net/remixfavoriteshowandgame/images/f/f3/Fanta.png/revision/latest?cb=20150522220257", batch: batch1})
student5 = Student.create!({first_name:"Alp",last_name:"Ro",picture:"https://static.scoupy.nl/alpro/images/cornerLogo.png", batch: batch1})
student4 = Student.create!({first_name:"Star",last_name:"Bucks",picture:"http://www.pngmart.com/files/3/Starbucks-Logo-PNG-File.png", batch: batch1})
student6 = Student.create!({first_name:"Oo",last_name:"Long",picture:"http://oolongteauk.co.uk/images/logo.png", batch: batch1})

evaluation = Evaluation.create!({time:"08/10/2017", color: "GREEN", remark: "", student: student1})
evaluation = Evaluation.create!({time:"08/09/2017", color: "YELLOW", remark: "lazy", student: student1})
evaluation = Evaluation.create!({time:"08/08/2017", color: "RED", remark: "stupid", student: student1})
evaluation = Evaluation.create!({time:"08/07/2017", color: "GREEN", remark: "", student: student1})

evaluation = Evaluation.create!({time:"08/10/2017", color: "YELLOW", remark: "lazy", student: student2})
evaluation = Evaluation.create!({time:"08/09/2017", color: "GREEN", remark: "", student: student2})
evaluation = Evaluation.create!({time:"08/08/2017", color: "RED", remark: "stupid", student: student2})
evaluation = Evaluation.create!({time:"08/07/2017", color: "GREEN", remark: "", student: student2})

evaluation = Evaluation.create!({time:"08/10/2017", color: "RED", remark: "stupid", student: student3})
evaluation = Evaluation.create!({time:"08/09/2017", color: "RED", remark: "stupid", student: student3})
evaluation = Evaluation.create!({time:"08/08/2017", color: "RED", remark: "stupid", student: student3})
evaluation = Evaluation.create!({time:"08/07/2017", color: "YELLOW", remark: "lazy", student: student3})

evaluation = Evaluation.create!({time:"08/10/2017", color: "YELLOW", remark: "lazy", student: student4})
evaluation = Evaluation.create!({time:"08/09/2017", color: "YELLOW", remark: "lazy", student: student4})
evaluation = Evaluation.create!({time:"08/08/2017", color: "RED", remark: "stupid", student: student4})
evaluation = Evaluation.create!({time:"08/07/2017", color: "GREEN", remark: "", student: student4})

evaluation = Evaluation.create!({time:"08/10/2017", color: "GREEN", remark: "", student: student5})
evaluation = Evaluation.create!({time:"08/09/2017", color: "GREEN", remark: "", student: student5})
evaluation = Evaluation.create!({time:"08/08/2017", color: "YELLOW", remark: "lazy", student: student5})
evaluation = Evaluation.create!({time:"08/07/2017", color: "GREEN", remark: "", student: student5})

evaluation = Evaluation.create!({time:"08/08/2017", color: "YELLOW", remark: "lazy", student: student6})
evaluation = Evaluation.create!({time:"08/07/2017", color: "GREEN", remark: "", student: student6})
