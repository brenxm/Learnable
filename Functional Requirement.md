 # Functional Requirement for Learnable
- Learnable is an educational mobile app that allows users to create personalized subjects with the help of AI. Users can define and control the content of thses subjscts, specifyng the scope and focus of the material. The subject materials are generated and presented in a sequential order, progressing from fundamental concepts to more advance topics.  
 A key feature of the app is its reinforcement system, which provides users with a daily quiz. These quizzes are dynamically geenrated by the AI based on the topics users have completed. This ensures that users reinforce their knowledge effectively through a spaced repitition approach, aiding in long-term retention and mastery of the material.
  
## Study Feature
1. ### Lecture Scene
   - Requirement ID: FR-001
   - Scene ID:
   - Descriptions:
      - Materials should be displayed to users in a sequential order
      - Special contents like codes, math equations or quoted messages have their own special font formats or containters
      - Each scene displays the material one topic at a time
      - Periodic engagement questions should interrupt the flow of material intervally
2. ### Assistive AI Chat
   - Requirement ID: FR-002
   - Descriptions:
      - Should be accessible in Lecture Scene 
3. ### Table of Contents
   - Requirement ID: FR-003
   - Descriptions:
       - Should be accesible in Lecture Scene
       - Navigates to completed topics and cannot go forward to uncompleted topics
       - Displays the current progress of the subject
       - Signifies current topic
       - Signifies if a quiz is ready for the topic
4. ### Subject Management Scene
   - Requirement ID: FR-004
   - Descriptions:
      - Users should be able to create new subject from this scene
      - Users can delete a subject
      - Users can sort subjects based on name, progress in percent and last date of accessed
      - Users can toggle between list mode view or book mode view (graphical icons view)
      - Each subject on the list should display:
         - Title
         - Progress in percent
         - Title of current topic
         - Count of completed topic and total topic count
5. ### Subject Creation Scene
   - Requirement ID: FR-005
   - Descriptions:
      - **TODO**
6. ### Reinforcement Feature (Quiz Scene)
   - Requirement ID: FR-006
   - Descriptions:
      - Daily Quiz
         - **TODO**
       - Optional Quiz
          - **TODO**
7. ### Personal Achievement Scene
   - **TODO**
8. ### Home Scene
   - Requirement ID: FR-007
   - Scene ID: SC-001
   - Descriptions:
      - Users should be able to navigate from this scene to:
        - Most recent lecture
        - New lecture
        - Question Management Scene
        - Subject Management Scene (Library)
        - Daily Quiz Scene
        - Quick Quiz Scene
        - Personal Achievement Scene
        - Settings Scene
9. Question Management Scene
