# Gossip Project

<img style="width: 500px" src="/app/assest/images/hastag-ruby.png" alt="My cool ruby"/>

## Getting Started

En ligne:
Vous pouvez retrouver mon site ici https://gossipcrud-bam-studio-v1.herokuapp.com/


En local :
Git clone le projet.
Placez-vous à la racine de celui-ci puis dans le terminal :

`rails db:migrate`
`rails db:seed`  => vous charge une base de donnée aléatoire.


SI les validations posent problèmes avec les commandes ci-dessus, faites dans l'ordre suivant :

````
rake db:drop
rake db:create
rake db:schema:load
rake db:seed

et enfin
rake db:migrate

````


## Built With

* [Ruby on rails](https://rubyonrails.org/) - The web framework used



## Authors

* **Stéphane Sdr** - *Initial work* -
