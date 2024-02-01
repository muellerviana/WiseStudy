# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
Article.create(title: "A oração dominical",
               description: "Jesus ensina a orar",
               content: "
               Portanto, vós orareis assim:
               <p>Pai nosso, que estás nos céus,
               santificado seja o teu nome;
               venha o teu reino;
               faça-se a tua vontade, assim na terra como no céu;
               o pão nosso de cada dia dá-nos hoje;
               e perdoa-nos as nossas dívidas,
               assim como nós temos perdoado aos nossos devedores;
               e não nos deixes cair em tentação;
               mas livra-nos do mal
               [pois teu é o reino,o poder e a glória para sempre. Amém]!
               Porque, se perdoardes aos homens as suas ofensas, também vosso Pai celeste vos perdoará;
               se, porém, não perdoardes aos homens [as suas ofensas], tampouco vosso Pai vos perdoará as vossas ofensas. </p>
               
               <p>Mateus 6:9-15</p", 
               author: "Jesus Cristo",
               image_url: "sample.jpg")