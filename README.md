MyStreet
========

Descrição
---------

__MyStreet__ será uma rede social que irá permitir a todos os utilizadores reportarem os mais variados problemas que possam surgir na sua vizinhança num ambiente informal e em que a interactividade assumirá um papel chave.
Tirando partido das funcionalidades existentes na maioria dos telemóveis que circulam hoje em dia, o utilizador poderá reportar situações como, por exemplo, luzes fundidas, buracos na estrada, falhas de energia, grafitis ofensivos, apenas "postando" a situação e identificando o local (seja de forma automática, preenchimento de morada ou selecção em mapa), podendo ainda adicionar fotografias demonstrativas.
Os funcionários das autarquias terão também acesso a esta rede e poderão ir dando um feedback em tempo real das situações que resolveram ou estão a resolver. Por outro lado, os funcionários poderão usar esta rede para informar quando irão proceder a essas alterações e qual o impacto esperado sobre o trânsito, evitando as inesperadas filas e buzinões associados.
Ao colocar os dois lados da questão em contacto, pretende-se ainda promover o debate, de modo a que possam surgir mais e melhores soluções a problemas da vizinhança.
Por outro lado, esta aplicação possuirá uma secção de perdidos e achados que permitirá informar a vizinhança de objectos que se tenham encontrado ou então de objectos que se tenham perdido e se pretendam recuperar, tudo em prol de uma boa vizinhança.

Motivação
---------

O principal motivo para a escolha deste projeto foi a sua utilidade pública. O principal objectivo deste projecto é servir as comunidades locais, ajudando a resolver problemas específicos de infraestruturas ou a melhorar as condições de vida através de ideias
e propostas que podem ser votadas e discutidas por todos.
Por outro lado, este tipo de interação fomenta as relações interpessoais melhorando, num ambito mais abrangente, a qualidade de vida de todos.
Todos estes aspetos, interpolados para uma visão mais alargada, farão com que seja mais fácil e mais agradável,
viver ou visitar aldeias, vilas e cidades onde o número de problemas foi reduzido e onde a identidade das pessoas
que nelas vivem está mais presente no ambiente que as rodeia.


Componentes
-----------

A aplicação pode ser subdividida em três componentes funcionais:

* Aplicação Web
A aplicação Web será o meio preferencial de interação com a aplicação e conterá todas as funcionalidades que se pretende que a aplicação tenha, desde registro e autenticação de utilizadores a adição de comentários, upload de fotografias, reportação de problemas ou classificação de soluções implementadas.
Para além destas funcionalidades, conterá ainda uma área de administração que será apenas acessível aos administradores do sistema e permitirá, emitir mapas estatísticos relativos à utilização da aplicação.

* Aplicação Mobile
A aplicação Mobile pretende tirar partido das características típicas dos smartphones atuais, quer seja a sua portabilidade e “omnipresença”, quer sejam as suas características físicas como a câmara e gps.
De um ponto de vista geral, a aplicação mobile será o mais próximo da aplicação Web possível, adaptado às dimensões de um telemóvel e permitindo que as fotografias representativas das ocorrências sejam tiradas de forma imediata a partir da câmara do telemóvel e que a localização da ocorrência possa ser obtida a partir do telemóvel.

* Base de dados
De modo a garantir a persistência dos dados e ainda o acesso global à aplicação, tudo isto num ambiente em que o sincronismo assume um papel essencial, será necessária a criação de uma base de dados robusta.
Esta base de dados deverá ser arquitectada de forma a que a sua resposta seja o mais célere possível, por isso a eficiência e escalabilidade da base de dados serão pontos fulcrais a ter em atenção no desenrolar deste projeto. 
A base de dados deverá ter a capacidade de armazenar utilizadores, problemas reportados, comentários, pontos de interesse, marcadores do mapa, fotografias, perdidos e achados, entre outros pontos que se achem relevantes.

  
Concorrência
------------
Existe uma aplicação chamada FixMyStreet (http://www.fixmystreet.com) que tem uma função semelhante à do nosso programa, mas operando apenas no Reino Unido. Funciona usando as ferramentas da mySociety (http://www.mysociety.org) que fornece feeds de informação, mapas e vários outros suportes.
Para além deste, várias outras aplicações baseadas no mesmo foram surgindo noutros paises, tal como Canadá, Alemanha ou Coreia. Em Portugal a aplicação "A Minha Rua" do portal do cidadão fornece o mesmo serviço, mas devido a uma interface complicada e pouco prática não tem muita adesão. Um novo projecto do eCivitas também chamada de "A Minha Rua" parece oferecer uma alternativa para freguesias inscritas no projecto, no entanto, não parece estar ainda a funcionar.
É a nossa intenção criar um projeto fundamentalmente diferente destes, criando uma aplicação que cative as pessoas e as incentive a usar o sistema. Pretendemos criar uma rede social onde os utilizadores podem interagir entre si, e fornecer uma interface simples e prática de usar, criando assim laços entre vizinhos e motivando-os a cuidar melhor do seu bairro. Funcionários públicos poderão ter acesso a problemas existentes nos locais pelos quais são responsaveis, melhorando assim não só a comunicação com os cidadãos, como também o tempo de resposta a problemas. 
Finalmente temos também como ambição criar uma aplicação que no futuro possa alargar-se a uma escala global e não limitar-se apenas a um país.
