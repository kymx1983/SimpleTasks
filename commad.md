# 新規作成
```
rails _6.0.3_ new simple_tasks
```

# git init
```
git init
git add .
git commit -m "初回"
git remote add origin https://github.com/kymx1983/simpletasks.git
git push -u origin master
```

# タスクの登録

## コントローラ作成
```
rails generate controller Task index show new
Running via Spring preloader in process 26258
      create  app/controllers/task_controller.rb
       route  get 'task/index'
get 'task/show'
get 'task/new'
      invoke  erb
      create    app/views/task
      create    app/views/task/index.html.erb
      create    app/views/task/show.html.erb
      create    app/views/task/new.html.erb
      invoke  test_unit
      create    test/controllers/task_controller_test.rb
      invoke  helper
      create    app/helpers/task_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    scss
      create      app/assets/stylesheets/task.scss
````