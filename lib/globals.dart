library scroll_list.globals;

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:scroll_list/product.dart';

import 'audiobook.dart';
import 'book.dart';
import 'music.dart';

File? image;
Image? imageEdit;
Product? productEdit;
int? index;

List books = [
  Book(
      "Harry Potter and the Philosopher's Stone",
      "J.K. Rowling",
      "assets/images/hp1.jpg",
      "Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter 'H'.Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin! Having now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.",
      "7.99"),
  Book(
      "Harry Potter and the Chamber of Secrets",
      "J.K. Rowling",
      "assets/images/hp2.jpg",
      "There is a plot, Harry Potter. A plot to make most terrible things happen at Hogwarts School of Witchcraft and Wizardry this year. Harry Potter's summer has included the worst birthday ever, doomy warnings from a house-elf called Dobby, and rescue from the Dursleys by his friend Ron Weasley in a magical flying car! Back at Hogwarts School of Witchcraft and Wizardry for his second year, Harry hears strange whispers echo through empty corridors - and then the attacks start. Students are found as though turned to stone... Dobby's sinister predictions seem to be coming true.Having now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.",
      "7.99"),
  Book(
      "Harry Potter and the Prisoner of Azkaban",
      "J.K. Rowling",
      "assets/images/hp3.jpg",
      "Welcome to the Knight Bus, emergency transport for the stranded witch or wizard. Just stick out your wand hand, step on board and we can take you anywhere you want to go.'\r\n\r\nWhen the Knight Bus crashes through the darkness and screeches to a halt in front of him, it's the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run - and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry's tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss...\r\n\r\nHaving now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.",
      "7.99"),
  Book(
      "Harry Potter and the Goblet of Fire",
      "J.K. Rowling",
      "assets/images/hp4.jpg",
      "There will be three tasks, spaced throughout the school year, and they will test the champions in many different ways ... their magical prowess - their daring - their powers of deduction - and, of course, their ability to cope with danger.'\r\n\r\nThe Triwizard Tournament is to be held at Hogwarts. Only wizards who are over seventeen are allowed to enter - but that doesn't stop Harry dreaming that he will win the competition. Then at Hallowe'en, when the Goblet of Fire makes its selection, Harry is amazed to find his name is one of those that the magical cup picks out. He will face death-defying tasks, dragons and Dark wizards, but with the help of his best friends, Ron and Hermione, he might just make it through - alive!\r\n\r\nHaving now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers",
      "7.99"),
  Book(
      "Harry Potter and the Order of the Phoenix",
      "J.K. Rowling",
      "assets/images/hp5.jpg",
      "'You are sharing the Dark Lord's thoughts and emotions. The Headmaster thinks it inadvisable for this to continue. He wishes me to teach you how to close your mind to the Dark Lord.'\r\n\r\nDark times have come to Hogwarts. After the Dementors' attack on his cousin Dudley, Harry Potter knows that Voldemort will stop at nothing to find him. There are many who deny the Dark Lord's return, but Harry is not alone: a secret order gathers at Grimmauld Place to fight against the Dark forces. Harry must allow Professor Snape to teach him how to protect himself from Voldemort's savage assaults on his mind. But they are growing stronger by the day and Harry is running out of time...\r\n\r\nHaving now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.",
      "7.99"),
  Book(
      "Harry Potter and the Half-Blood Prince",
      "J.K. Rowling",
      "assets/images/hp6.jpg",
      "There it was, hanging in the sky above the school: the blazing green skull with a serpent tongue, the mark Death Eaters left behind whenever they had entered a building... wherever they had murdered...\r\n\r\nWhen Dumbledore arrives at Privet Drive one summer night to collect Harry Potter, his wand hand is blackened and shrivelled, but he does not reveal why. Secrets and suspicion are spreading through the wizarding world, and Hogwarts itself is not safe. Harry is convinced that Malfoy bears the Dark Mark: there is a Death Eater amongst them. Harry will need powerful magic and true friends as he explores Voldemort's darkest secrets, and Dumbledore prepares him to face his destiny...\r\n\r\nHaving now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.",
      "7.99"),
  Book(
      "Harry Potter and the Deathly Hallows",
      "J.K. Rowling",
      "assets/images/hp7.jpg",
      "'Give me Harry Potter,' said Voldemort's voice, 'and none shall be harmed. Give me Harry Potter, and I shall leave the school untouched. Give me Harry Potter, and you will be rewarded.'\r\n\r\nAs he climbs into the sidecar of Hagrid's motorbike and takes to the skies, leaving Privet Drive for the last time, Harry Potter knows that Lord Voldemort and the Death Eaters are not far behind. The protective charm that has kept Harry safe until now is broken, but he cannot keep hiding. The Dark Lord is breathing fear into everything Harry loves and to stop him Harry will have to find and destroy the remaining Horcruxes. The final battle must begin - Harry must stand and face his enemy...\r\n\r\nHaving now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.",
      "7.99"),
];

List musics = [
  Music(
      "Studio Albums 1978-1984",
      "Van Halen",
      "assets/images/m1.jpg",
      "Six disc set collects all of the David Lee Roth era studio albums in one clamshell box. Features the albums 'Van Halen', 'Van Halen II', 'Women & Children First', 'Fair Warning', 'Diver Down' and '1984'.",
      "7.99"),
  Music(
      "Sings Nesmith",
      "Micky Dolenz",
      "assets/images/m2.jpg",
      "2021 release, Micky Dolenz's first new solo studio album in nine years. The album is packed with songs Michael Nesmith wrote throughout his career, all beautifully reimagined by Dolenz. And who better to produce it than Nesmith's son, Christian Nesmith, who has done a brilliant job in coming up with fresh and completely new arrangements for all of the songs. This is the album Monkees fans have waited years to hear.",
      "7.99"),
  Music(
      "Electric Youth (Deluxe Edition 3CD+DVD)",
      "Debbie Gibson",
      "assets/images/m3.jpg",
      "Deluxe three CD + DVD edition of Debbie Gibson's sophomore album Electric Youth. Cherry Red is delighted to continue their Debbie Gibson re-issue series with the multi- million selling smash Electric Youth. After exploding onto the charts with her debut album Out Of The Blue, Debbie Gibson racked up an impressive string of international hits. Singles from her debut, such as 'Only In My Dreams', 'Foolish Beat' and 'Shake Your Love', quickly made her a household name. Her second album, Electric Youth, originally released in 1989, spent five weeks on top of The Billboard Hot 100, selling over two million copies in the process.",
      "7.99"),
  Music(
      "Cowboy Bebop",
      "COWBOY BEBOP / O.S.T",
      "assets/images/m4.jpg",
      '"Title:	Cowboy Bebop [Import]\\n'+ 'Genre:	Soundtrack\\n'+ 'Theme:	Cowboy Bebop\\n'+ 'Attributes:	Japan - Import\\n'+ 'Release Date:	12/21/2012\\n'+ 'Label:	JVC\\n'+ 'Product Type:	CD\\n'+ 'Catalog #:	5031874\\n'+ 'UPC:	4580325313642\\n'+ 'Item #:	1527683X"',
      "7.99"),
  Music(
      "Chosen",
      "Maneskin",
      "assets/images/m5.jpg",
      'Artist:	Maneskin\n'+ 'Title:	Chosen [Import]\n'+ 'Genre:	Rock\n'+ 'Attributes:	Extended Play, Germany - Import\n'+ 'Release Date:	12/22/2017\n'+ 'Label:	RCA Records Label\n'+ 'Product Type:	CD\n'+ 'Catalog #:	5814052\n'+ 'UPC:	190758140520\n'+ 'Item #:	1993094X',
      "7.99"),
];

List audiobooks = [
  AudioBook(
      "Will",
      "Will Smith",
      "assets/images/a1.jpg",
      "One of the most dynamic and globally recognized entertainment forces of our time opens up fully about his life, in a brave and inspiring book that traces his learning curve to a place where outer success, inner happiness, and human connection are aligned. Along the way, Will tells the story in full of one of the most amazing rides through the worlds of music and film that anyone has ever had.",
      "7.99"),
  AudioBook(
      "The Judge's List: A Novel",
      "John Grisham",
      "assets/images/a2.jpg",
      "#1 NEW YORK TIMES BEST SELLER • Investigator Lacy Stoltz follows the trail of a serial killer, and closes in on a shocking suspect—a sitting judge—in “one of the best crime reads of the year.… Bristling with high-tech detail and shivering with suspense…. Worth staying up all night to finish” (Wall Street Journal).",
      "7.99"),
  AudioBook(
      "The Last Thing He Told Me: A Novel",
      "Laura Dave",
      "assets/images/a3.jpg",
      "#1 NEW YORK TIMES BESTSELLER SELECTION OF THE REESE WITHERSPOON BOOK CLUB A BEST BOOK OF 2021 BY REAL SIMPLE AND VOGUE A HIGHLY ANTICIPATED, BEST BOOK OF SUMMER SELECTED BY * VOGUE * USA TODAY * ENTERTAINMENT WEEKLY * CNN * TOWN & COUNTRY * PARADE * BUSTLE * AND MORE!",
      "7.99"),
  AudioBook(
      "The Lincoln Highway: A Novel",
      "Amor Towles",
      "assets/images/a4.jpg",
      'In June, 1954, eighteen-year-old Emmett Watson is driven home to Nebraska by the warden of the juvenile work farm where he has just served fifteen months for involuntary manslaughter. His mother long gone, his father recently deceased, and the family farm foreclosed upon by the bank, Emmett\'s intention is to pick up his eight-year-old brother, Billy, and head to California where they can start their lives anew. But when the warden drives away, Emmett discovers that two friends from the work farm have hidden themselves in the trunk of the warden\'s car. Together, they have hatched an altogether different plan for Emmett\'s future, one that will take them all on a fateful journey in the opposite direction—to the City of New York.',
      "7.99"),
  AudioBook(
      "Go Tell the Bees That I Am Gone",
      "Diana Gabaldon",
      "assets/images/a5.jpg",
      '#1 New York Times bestselling author Diana Gabaldon returns with the newest novel in the epic Outlander series. The past may seem the safest place to be ... but it is the most dangerous time to be alive. ...Jamie Fraser and Claire Randall were torn apart by the Jacobite Rising in 1746, and it took them twenty years to find each other again. Now the American Revolution threatens to do the same. It is 1779 and Claire and Jamie are at last reunited with their daughter, Brianna, her husband, Roger, and their children on Fraser\'s Ridge. Having the family together is a dream the Frasers had thought impossible. Yet even in the North Carolina backcountry, the effects of war are being felt. Tensions in the Colonies are great and local feelings run hot enough to boil Hell\'s teakettle. Jamie knows loyalties among his tenants are split and it won\'t be long until the war is on his doorstep. Brianna and Roger have their own worry: that the dangers that provoked their escape from the twentieth century might catch up to them. Sometimes they question whether risking the perils of the 1700s-among them disease, starvation, and an impending war-was indeed the safer choice for their family. Not so far away, young William Ransom is still coming to terms with the discovery of his true father\'s identity-and thus his own-and Lord John Grey has reconciliations to make, and dangers to meet ... on his son\'s behalf, and his own. Meanwhile, the Revolutionary War creeps ever closer to Fraser\'s Ridge. And with the family finally together, Jamie and Claire have more at stake than ever before',
      "7.99"),
  AudioBook(
      "Wish You Were Here: A Novel",
      "Jodi Picoult",
      "assets/images/a6.jpg",
      'Diana O’Toole is perfectly on track. She will be married by thirty, done having kids by thirty-five, and move out to the New York City suburbs, all while climbing the professional ladder in the cutthroat art auction world. She’s an associate specialist at Sotheby’s now, but her boss has hinted at a promotion if she can close a deal with a high-profile client. She’s not engaged just yet, but she knows her boyfriend, Finn, a surgical resident, is about to propose on their romantic getaway to the Galápagos—days before her thirtieth birthday. Right on time.',
      "7.99"),
  AudioBook(
      "The Storyteller: Tales of Life and Music",
      "Dave Grohl",
      "assets/images/a8.jpg",
      'Having entertained the idea for years, and even offered a few questionable opportunities (It s a piece of cake! Just do four hours of interviews, find someone else to write it, put your face on the cover, and voila!) I have decided to tell these stories just as I have always done, in my own voice. The joy that I have felt from chronicling these tales is not unlike listening back to a song that I\'ve recorded and can\'t wait to share with the world, or reading a primitive journal entry from a stained notebook, or even hearing my voice bounce between the Kiss posters on my wall as a child.',
      "7.99"),
];