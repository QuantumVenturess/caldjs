module PagesHelper
  
  def what
    a = content_tag :p do
      "We are a group of DJs who started specializing in weddings after attending too many where the DJs were generic, subpar, or even pure clowns. We love to make people dance and our mix of music reflects that. We keep it classy on the mic and provide top notch sound systems to boot."
    end
    b = content_tag :p do
      "Our DJ experiences span many years from rocking house parties to clubs to charity galas to corporate events to weddings. The music we play at any event is solely determined by the people in attendance. We can comfortably cover music from the last 50 years from soul to funk to disco to rock, swing, ballroom, 80s, 90s, pop, hip hop, electro, top 40, indie, and international flavors like bhangra, salsa, tango, and banda. We're able to mix it all together seamlessly and provide a well concocted blend that fuels non stop dancing!"
    end
    a + b
  end

  def philosophy_a
    a = content_tag :p do
      "Whether your wedding is held in a ballroom, on the beach, or in a barn, it's a time of joyous celebration and intense partying! But it's also a unique production that involves many moving parts! And that's where we step in with a personal approach to our craft. We work with clients closely throughout the whole wedding planning process to ensure we:"
    end
    a
  end

  def philosophy_b
    a = content_tag :p do
      "And on your wedding day, we make sure that you remember us only as the background ninjas who ran your reception smoothly and provided the tunes for a smashing dance party!"
    end
    a
  end

  def henry_wang
    a = content_tag :p do
      "Henry is a classically trained musician who began playing violin at the tender age of 7. While he was in high school he was First Chair Concert Violinist for the Tracy School District Orchestra. Henry started DJing in 2002 as a freshman in high school."
    end
    b = content_tag :p do
      "He began DJing with extreme humble beginnings. To not burden his parents financially, in 2002 he sold candy door to door and used the money he made from that to buy his first pair of Technic 1200 turntables. He started with TV speakers he bought from a garage sale and started DJing high school house parties for little to no money. People in the community quickly saw his talent and as his talents began sought after. He soon saved enough for more equipment and by his senior year he was DJ'd many of the local schools winter balls. Today he owns numerous state of the art equipment; turntables, mixer boards, and Mackie sound systems."
    end
    c = content_tag :p do
      "Henry was soon discovered by local party promoters and has spun at some of the SF bay area's top clubs & lounges (short list:  Sloane, The Rouge, Angels Ultra Lounge, and more) over the years while also branching out to rocking corporate events and weddings at iconic locations such as San Francisco Design Center, Palace Hotel and more) His versatile open format style mixes hip hop, pop, rock, funk, soul/R&B, dance/electro, international music, and everything in between to connect a unique flavor and signature flow that fuels even the most diverse of crowds."
    end
    d = content_tag :p do
      "In addition to DJing, Henry enjoys ministering to others about God, traveling, studying Spanish, Salsa, Tango dancing, spending time with Charlie his labrador retriever and martial arts."
    end
    a + b + c + d
  end
end