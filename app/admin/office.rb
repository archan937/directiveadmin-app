ActiveAdmin.register Office do
  menu :priority => 1
  actions :all
  config.sort_order = "city_asc"

  index do
    column "Office", "city", :link_to => true
    column "Employees", "COUNT(employees.id) AS employees"
    column "Address", "address_line1"
    column "postal_code"
    column "state"
    column "country"
    actions
  end

  filter "city"
  filter "address_line1", :label => "Address"
  filter "postal_code"
  filter "state"
  filter "country"

end
