
VAR health = 100
VAR enemy_health = 100
VAR max_damage = 20
VAR damage = 20
VAR enemy_damage = 20
VAR combat_skill = 1
VAR knife = -2
VAR empathy = 0
VAR first_time_start = 1
VAR first_time_dead = 1
VAR first_time_ghost =1
VAR first_time_undead =1
VAR first_time_killer =1
->start
===start===
~health = 100
~enemy_health = 100
~combat_skill += RANDOM(1,5)
~knife = -2

{first_time_start == 1  : Basil had just moved into his new apartment and was unpacking his boxes when he heard a noise from the other room. He thought it might be his new neighbor, so he went to investigate. But instead of finding his neighbor, Basil found a man going through his belongings. The man saw Basil and pulled out a knife.| {~Basil saw again the burgler with the knife in his hand.|And here Basil is again in front of the armed man.|The armed burglar turned and observed Basil.} }


~first_time_start = 0


+ {combat_skill>=10}[take the knife] 
  {~Basil took the knife|Basil smirked with knife in hand} 
  ~ knife = 2 
  ->battle
+ {empathy > 6}[talk] ->Victory
+ [hit the burglar] {~Basil hits the man|The fight started|Basil punched the burglar} ->battle
+ [run away]->Death
===Death===

 { first_time_dead == 1: Basil tried to run, but the man caught up to him and stabbed him in the back. Basil collapsed to the floor, bleeding to death. The man took some of Basil's belongings and fled the scene. If only Basil had been more careful, he might still be alive today.| {~Basil dropped dead again.|Basil collapsed to the floor, bleeding to death.|Basil felt the life sipping out from his body}}
 ~first_time_dead = 0
 ->ghost
 
 ===Murder===
 
 {first_time_killer == 1 : So, Basil did the only thing he could think of. He attacked the burglar, trying to get him away from the safe. The fight was brutal and both men were injured. In the end, Basil managed to kill the burglar. But, at what cost? Basil was filled with adrenaline after committing murder. He felt alive like never before. But as the reality of what he had done set in, he began to feel fear and guilt creeping in. He knew that he had just damned himself forever. There was no going back now. He would spend eternity in Hell. But what did that mean? Was it just a metaphor, or did it really exist? | {~Ok, back to the Hell?|Basil is damned again.|Basil felt already the Hell's pits|Going to the devils?}}
 ~first_time_killer = 0
 +[Maybe go 10 seconds back in time]
    ~empathy+=RANDOM(1,3)
    
    "No way i'm going to hell"- thought Basil. 
    Empathy: {empathy}
    ->start
+[He found his end] Basil got the phone from the pocket and called 911...  
 ->END
 ===ghost===
 
{first_time_ghost == 1: When he woke up, he was in a strange place, with no idea how he got there. He could barely move, and it was as if he were walking through a dream. He soon realized that he was in some sort of afterlife, and that this place was inhabited by ghosts. The ghosts were friendly and welcoming, and they showed Basil around the place.Basil soon learned that this place was a sort of limbo, where the ghosts lingered until they were ready to move on to the next life. He also learned that he had died in the attack, and that this place was his new home. One day a Ghost gave him a magic talisman to go back in his live for 10 seconds before the death.|{~Ghost again| Basil's a spirit again| Basil saw again his transparent body and sighed} }
~first_time_ghost = 0
 +[go back in time for 10 seconds] 
 {first_time_undead :At first, he wasn't sure what was happening. He could feel the cold, hard ground beneath his spectral form, and the chilly breeze blowing through his ethereal hair. He couldn't see more the other ghosts around him.Basil was ecstatic. He finally felt alive, like he had been missing out all this time. He had begun to feel as though his skills had improved dramatically.He couldn't explain it, but he knew that his newfound power was real. He had never felt this good in a fight before; everything just seemed to click. He was confident and in control, and he knew that he could take on anyone who crossed him.He wasn't sure where this new power came from, but he intended to make full use of it.|{~Basil is alive again.| Back to the house in  flash| Basil felt how his body took substance in seconds}} 
 ~first_time_undead = 0
 Combats Skills :{combat_skill}

 ->start
 +[Go to heaven]->heaven
===heaven===
"What a stupid think to do", said Basil and threw away the talisman.
Basil spent many happy days among the ghosts, but eventually he began to feel restless. He wanted to move on to the next life. Basil started to feel like a fraud and he didn't like it. He decided that it was time to move on to heaven and leave his old life behind.
He had heard about heaven, but he wasn't sure if that was the right place for him. He didn't really believe in God, so he wasn't sure if that was an option.

One day, Basil decided to go to heaven and see for himself. He was surprised to find that it was exactly as he had always imagined it would be. There were beautiful fields and gardens, and the sun always shone brightly. He felt happy there, and he knew it was the right place for him.

Basil spent his days wandering through the fields and gardens, enjoying the peace and beauty of heaven. He knew he would never have to worry or fear again, and he was finally content.
->END
===Victory===
The man ordered Basil to hand over his money and possessions, but Basil refused. He told the man that he didn't have any money and that he could take whatever he wanted. The man didn't believe him, so Basil offered to make him a sandwich instead. The man agreed and Basil quickly made him a sandwich and handed it to him. After eating the sandwich, the man said that he was sorry for breaking into Basil's home and left. Basil smiled a strange smile at some fast fading memories.
->END
===battle===

- (top) 
VAR min_damage = 0

 ~ damage = MAX(RANDOM(MAX(-knife*10,0) , max_damage - knife*10),1)
 ~ health -= damage 
  ~ enemy_damage = RANDOM(combat_skill , max_damage + combat_skill) 
 ~ enemy_health -= enemy_damage
 { knife < 0 : The burglar {~stabbed at|cutted|jabbed}  Basil\'s {~head|torso|{~right|left} hand|{~right|left} leg|belly} and Basil {~kicked|punched|backhanded} back|Basil  {~stabbed at|cutted|jabbed}  burglar\'s {~head|torso|{~right|left} hand|{~right|left} leg|belly} and the burglar {~kicked|punched|backhanded} back}
 Basil: - {damage} HP Health:  {health} HP.
 <> Burgler:- {enemy_damage} HP Health: {enemy_health} HP.
  
   + { health < 0} -> 
       <> "You killed me!" Cried Basil. 
  -> Death 
   +   { enemy_health < 0} -> 
       <> Basil killed the burglar 
  -> Murder
 +   { damage > health }-> 
   <> "I can't take another hit like that." mound Basil.

 +   {damage == 0} -> 
    <> "Ha! Missed me!" smirked Basil.
 +   { damage <= 3} -> 
    <> "Just a flesh-wound!" smiled Basil. 

 +   { health < 10} -> 
   <> "I can't take much more of this!" cried Basil.
 +   { health < 50 } -> 
   <> "This isn't going as well as I'd hoped it would." said Basil.

 +   { health > 80 } { damage < 5 } -> 
   <> "What? Are you going to tickle me to death?" laught Basil. 
 +   { damage > 15 } -> 
  <>  Basil lost his breath -"Ow, that really hurt!"
 
 +   { enemy_damage > enemy_health }-> 
   <> "He is nearly done." thought Basil.

 +   {enemy_damage == 0} -> 
    <> "Ouch i missed completly" thought  Basil.
 +   { damage <= 3} -> 
    <> "I need to try harder!" thought Basil.

 +   { enemy_health < 10} -> 
   <> "One more punch and i'll finish him!" thought Basil.
 +   { enemy_health < 50 } -> 
   <> "Half job finished." smiled Basil.thought Basil.

 +   { enemy_health > 80 } { enemy_damage < 5 } -> 
   <> "What? I need to take some karate lessons." 
 +   { enemy_damage > 15 } -> 
   <> "Ow, what a punch i made" thought Basil.

 +   ->  // fallback that does nothing

-   -> top


