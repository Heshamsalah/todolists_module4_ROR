User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users_data = [
  {uname: "Fiorina", pass: "12345", f_name: "Carly", l_name: "Fiorina", b_date: 1954, gender: "female", listname: "f1", todoitemdata: {titl: "a", desc: "aa", done: true}},
  {uname: "Trump", pass: "12346", f_name: "Donald", l_name: "Trump", b_date: 1946, gender: "male", listname: "t1", todoitemdata: {titl:"b", desc: "tt", done: false}},
  {uname: "Carson", pass: "12347", f_name: "Ben", l_name: "Carson", b_date: 1951, gender: "male", listname: "b1", todoitemdata: {titl: "c", desc: "bb", done: false}},
  {uname: "Clinton", pass: "12348", f_name: "Hillary", l_name: "Clinton", b_date: 1947, gender: "female", listname: "c1", todoitemdata: {titl: "d", desc: "cc", done: true}}
]

users_data.each do |raw|
  user = User.create(username: raw[:uname], password_digest: raw[:pass])
  user.create_profile(gender: raw[:gender], first_name: raw[:f_name], last_name: raw[:l_name], birth_year: raw[:b_date])
  usertodolist = user.todo_lists.create(list_name: raw[:listname], list_due_date: Date.today + 1.year)
  for i in 0..4
    usertodolist.todo_items.create(title: raw[:todoitemdata][:titl], description: raw[:todoitemdata][:desc], completed: raw[:todoitemdata][:done], due_date: Date.today + 1.year)
  end
end
