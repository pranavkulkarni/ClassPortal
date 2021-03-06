Rails.application.routes.draw do
  resources :email_notifications
  resources :messages
  resources :course_materials
  resources :grades
  resources :enrollments
  resources :courses
  resources :students
  resources :instructors
  resources :admins


  post 'logins/validate' => 'logins#validate'
  post 'logins/signupValidate' => 'logins#signupValidate'
  get 'logins/signup' => 'logins#signup'
  get 'logins/index' => 'logins#index'
  get 'logins/logout' => 'logins#logout'
  get 'admins/land/home' => 'admins#home'
  get 'admins/land/add_grade/:id' => 'admins#add_grade'
  post 'admins/land/add_grade/add_grade_admin' => 'admins#add_grade_admin'
  get 'instructors/land/home' => 'instructors#home'
  get 'students/land/home' => 'students#home'
  post 'instructors/land/dispatcher' => 'instructors#dispatcher'
  get 'instructors/land/manage_student/:id' => 'instructors#manage_student'
  get 'instructors/land/manage_course_material/:id1/:id2' => 'course_materials#index'
  get '/instructors/land/send_view_messages/new_message/:tokenCourseId/:tokenStudId' => 'messages#new_message'
  post '/instructors/land/send_view_messages/new_message/:cId/create' => 'messages#create_message'
  get 'instructors/land/add_enrollment/:id' => 'instructors#add_enrollment'
  get '/instructors/land/send_view_messages/:cId' => 'instructors#send_and_view_messages'
  post 'instructors/land/add_enrollment/enroll_student'  => 'instructors#enroll_student'
  post 'instructors/land/manage_student/manage_stud_dispatcher'  => 'instructors#manage_stud_dispatcher'
  post 'course_materials/new' => 'course_materials/new'
  post 'course_materials/:id' => 'course_materials#destroy'
  get 'admins/land/destroy/:id'   => 'admins#destroy'
  get 'courses/land/destroy/:id'   => 'courses#destroy'
  get 'instructors/land/destroy/:id'   => 'instructors#destroy'
  get 'students/land/destroy/:id'   => 'students#destroy'
  get 'students/land/view_courses/:id' => 'students#view_courses'

  get 'students/land/drop_course/:cId' => 'students#drop_course'
  post 'students/land/dispatcher' => 'students#dispatcher'
  get '/students/land/enrollment_page' => 'students#enrollment_page'
  post 'students/land/enroll_course' => 'students#enroll_course'
  post 'students/land/register_for_email' => 'students#register_for_email'
  get 'students/land/search_course' => 'students#search_course'
  post 'students/land/search_result' => 'students#search_result'
  get 'students/land/send_and_view_messages/:cId' => 'students#send_and_view_messages'
  post 'students/land/send_and_view_messages/new_message' => 'messages#new_message'
  post 'students/land/send_and_view_messages/create' => 'messages#create_message'

  get 'instructors/land/view_courses/:id' => 'instructors#view_courses'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'logins#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
