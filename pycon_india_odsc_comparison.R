library(tidyverse)

tribble(~Event, ~Ticket,
  "ODSC",9000,
  "The Fifth Elephant", 7200,
  "PyCon India",1100) %>% 
  mutate(Event = fct_reorder(Event, Ticket)) %>% 
ggplot(aes(Event,Ticket, fill = Event)) + 
  
  
  geom_bar(stat = "identity", 
           width = 0.5,
           show.legend = F) +
  
   geom_point(aes(Event,Ticket, color = "red"), 
         #  width = 0.5,
            show.legend = F) +
 
  scale_y_continuous(labels=scales::dollar_format(prefix=sprintf('₹'))) +
  scale_fill_manual(values=c('#f2b10b','#816894', '#00bcdd'))+  #scale_y_continuous(labels = function(x) paste0("\u20B9", x)) +
#  coord_flip() +
  ggthemes::theme_hc(style = "darkunica") +

  ggrepel::geom_label_repel(aes(Event,Ticket, label = paste( 'Rs.', Ticket)),
                            arrow = arrow(length = unit(0.03, "npc")),
                            box.padding = 2) +
  
  labs(title = "Which ticket would you want to buy?",
       subtitle = "Loss Function - Ticket Cost ₹",
       x = "Upcoming (Data Science) Events in India",
       y = "Ticket (in Indian Rupees)")  +
   theme(legend.position="none") +
  theme(title  =element_text(colour="white", size = 20)) +
   theme(axis.text.x=element_text(colour="green", size = 12)) +
  theme(axis.text.y=element_text(colour="red", size = 12)) 
 
