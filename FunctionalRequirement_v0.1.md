 # Functional Requirement
- **Title**: Learnable

## Core Principles and Purpose
1. // Utilize AI to learn virtually anything
2. // Change the way how people acquire knowledge instead of the old school way like going to school. But instead utilize technology and AI to boost learning.
3. // People are more effective in learning if the content is personalized (e.g., choice of content, tone of materials delivery)
4. // A way to structure your acquired knowledge of your experience as a master or specialist of a certain task to a structured lecture to share and mentor people
5. 
## Core Functions of this app
1. Study lectures in a structured and engaging way, making content easier to absorb with the help of AI-powered assistant chat.
2. Create a fully customizable lectures with AI support, allowing for a personalized learning experience.
3. Share or sell your created lectures in the Lecture Shop, providing access to a wider audience.
4. Reinforce learning with a daily quiz that utilizes spaced repetition, ensuring long-term retention of key topics.

|Code|Description|
|:---|:---|
| SC-003 | Lecture Scene | 

## Study Feature
1. ### Lecture Scene
   - **Requirement ID**: FR-003
   - **Scene ID**: SC-003
   - **Purpose**: To deliver lecture content in a structured, linear format that enforces active user engagement.
   - **Descriptions**:
      - The scene shall display lecture content in **linear, top-to-bottom scrollable interface**, allowing users to navigate forward/backward within the current topic only. 
      - The system shall render **code blocks, math equations, and quoted messages** in a dedicated containers to distinguish them from standard text (desgin specs apply).
      - The system shall display **one topic per scene**; users must complete the current topic to access the next.
      - The system shall **interrupt lecture content every end of each page** to display an engagement question. Users must submit a response to move forward to next topic page.
2. ### Engagement Question
   - **Requirement ID**: TBD
   - **UI Requirement**: TBD
       - // Question should be about the current topic
       - // There should be two type of engagement question, multiple choice and free-text-response
       - // Question should be embeded at the end the topic
       - // User required to answer before moving on
       - // Feedback should be given to user regardless provided correct or incorrect question
       - // After feedback provider to patient, system should provide option to user if add one more question or move forward to next topic
     
3. ### Assistive AI Chat
   - **Requirement ID**: FR-002
   - **UI Requirement**: UI-003.5
   - **Descriptions**:
      - The system shall be accessible within the Lecture Scene (SC-003), utilizing a vertical sliding behavior within its own UI layer. Users can open or close the chat system via a toggle button within the Lecture Scene.
      - The system shall maintain context awareness by tracking both the topic and chat history for interactions between the chat assistant and users.
      - The system shall provide **dedicated fields** with **specialized formatting support** and ensure compatability to standard rendering for entering programming code or mathematical equations. It will automatically detect such inputs and prompt users to embed a **special field** for the detected format. Users can also manually embed these **dedicated fields** via button in the chat text field.
      - The system shall support multiple dedicated fields within the input flow, each functioning as a self-contained unit. users shall be able to create, delete, and navigate between these fields, as well as return to a standard text input.
      - The system shall provide additional keyboard input for commonly used characters when the typing keyboard is active, reducing the need for users to browse the default keyboard system. UI buttons that simulate keyboard keys shall be available while users are typing. (e.g., **tab** button for tab spaces when writing a programming code)
4. ### Table of Contents
   - **Requirement ID**: FR-003
   - **UI Requirement**: UI-003.4
   - **Descriptions**:
       - Should display all the topics in a list
       - Should be accesible in Lecture Scene via toggle button
       - Navigates to completed topics and cannot go forward to uncompleted topics
       - Displays the current progress of the subject
       - Signifies current topic
       - Signifies if a quiz is ready for the topic
       - System shall distinguish completed topics to uncompleted topics by rendering text of uncompleted topics to gray
## Subject Management
1. ### Subject Management Scene
   - **Requirement ID**: FR-004
   - **Scene ID**: TBD
   - **Descriptions**:
      - Users should be able to create new subject from this scene
      - Users can delete a subject
      - Users can sort subjects based on name, progress in percent and last date of accessed
      - Users can toggle between list mode view or book mode view (graphical icons view)
      - Each subject on the list should display:
         - Title
         - Progress in percent
         - Title of current topic
         - Count of completed topic and total topic count
2. ### Subject Creation Scene
   - **Requirement ID**: FR-005
   - Scene ID: SC-005
   - **Descriptions**:
      - // Create in specific sequence to promote guided interaction using Step-by-step flow Wizard
        1. Create base curriculum
            - Describe base curriculum
            - Add default loaded preset
            - Present generated curriculum + prompt of confirmation
        2. Tone of delivery
            - options presented in radio buttons or a custom delivery
            - present example from one of the topics generated from curriculom + prompt of confirmation 
        3. Add ons
            - Engagement question
            - Topic ending curriculum
        4. Generate
        
## Reinforcement Feature
1. ### Daily Quiz Scene
   - **Requirement ID**: FR-006
   - **Descriptions**:
      - Daily Quiz
         - **TODO**
       - Optional Quiz
          - **TODO**
2. ### Personal Achievement Scene
   - **Requirement ID**: FR-007
   - **Scene ID**: SC-002
   - **Description**:
      - It should display/signify:
         - The dates when users studied for a minumum of 15 minutes a day
         - The dates when users took the daily quiz
         - How many subjects were generated
         - How many subjects were completed
         - How many questions were generated
         - How many questions were answered correctly
8. ### Home Scene
   - **Requirement ID**: FR-008
   - **Scene ID**: SC-001
   - **Descriptions**:
      - Users should be able to navigate from this scene to:
        - Most recent lecture
        - New lecture
        - Question Management Scene
        - Subject Management Scene (Library)
        - Daily Quiz Scene
        - Quick Quiz Scene
        - Personal Achievement Scene
        - Settings Scene
9. ### Question Management Scene
   - **Requirement ID**: FR-009
   - **Scene ID**: TBD
10. ### Setting Scene
   - **Requirement ID**: FR-010
   - **Scene ID**: TBD

## Miscellaneous
1. ### Subscription
   - **Requirement ID**: FR-011
   - **Description**:
      - New users should be offered with free 7 day trial access. Each user should only be granted one free trial
      - Subscription is required for users to continue usage after free trial  
2. ### Subscription Scene
   - **Scene ID**: TBD
   - **Description**:
      - Subscription scene should be displayed as a start up scene with each app reset or if app is newly opened. Only applicable to non-subscriber or free-trial users.
      - Subscription scene should display the cost of the subscription, perks, benefits and days of free trial remaining (if applicable)
      - Users with expired free trial access should not be able to bypass the subscription scene. The user is required to sign up for a subscription to continue/gain access to the service.
