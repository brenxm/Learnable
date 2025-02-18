 # Functional Requirement
- **Title**: Learnable

**Core Principles and Purpose**
---------------------------------
- **Harness AI to enable learning across virtually any subject.**
- **Revolutionize education by replacing traditional classroom methods with innovative technology and AI-driven approaches.**
- **Personalize the learning experience—tailoring content selection and delivery tone to maximize effectiveness.**
- **Transform expert knowledge into structured lectures, empowering specialists to share insights and mentor others.**

**Core Functions of This App**
------------------------------
- **Engage with lectures in a structured, captivating format, supported by an AI-powered chat assistant for easier comprehension.**
- **Customize lectures fully with AI assistance, creating a personalized learning journey.**
- **Share or monetize your lectures via the Lecture Shop, expanding access to a wider audience.**
- **Reinforce learning with daily quizzes that apply spaced repetition, ensuring long-term retention of key topics.**


## Scene Identification Table
|Requirement ID|Title|Subdomain|
|:---|:---|:--- |
| FR-001 | Home Page | |
| [FR-003](#fr-003) | Lecture Scene || 
| [FR-004](#fr-004)| Engagement Question |

# Functional Requirements
1. ## <a id="fr-003"></a>Lecture Scene
**Requirement ID:** FR-003  
  
**Scene ID:** SC-003

**Descriptions**:
- **Lecture Content Display:**  
   - The scene shall present lecture content in a **linear, top-to-bottom scrollable interface**.  
   - Navigation is restricted to moving forward and backward **within the current topic only**.
- **Specialized Content Rendering:**  
   - The system shall render **code blocks, math equations, and quoted messages** in dedicated containers to distinguish them from standard text.  
   - (Refer to the associated design specifications for style details.)
- **Topic-Based Navigation:**  
   - The scene shall display **one topic per scene**.  
   - Users must complete the current topic before accessing the next one.
- **Engagement Questions:**  
   - At the end of each topic page, the system shall interrupt the lecture content to display an **engagement question** ([FR-003.6](#fr-003-6)).  
   - A valid user response is required to proceed to the next topic page, after which feedback is provided.
- **Table of Contents Access:**  
   - The scene shall include a toggle button allowing users to access the **table of contents**.  
   - This enables users to view their progress and navigate to previously completed topics.
- **Chat Assistant:**  
   - The scene shall allow users to access a **chat assistant** ([FR-002](#fr-002)) for real-time guidance, explanations, and support related to the lecture content.  
   - The chat assistant box shall display the chat history for the current topic only.
   
#### Acceptance Criteria
 - The system must provide smooth vertical scrolling from the start to the end of the topic.
 - Upon reaching the end of a topic, the engagement question must be triggered.  
 - A user must submit a response, after which appropriate feedback is provided before proceeding.
 - Code blocks, math equations, and quoted messages must be rendered with distinctive styles as per design specifications.
 - A toggle button must be available to open and close the table of contents.
 - It can also be accessed with left-to-right scroll gesture.   
 - The chat assistant must be accessible at any point during the lecture and display only the chat history relevant to the current topic.
    
#### Rationale
- **Linear Navigation Focus:**  
  A linear, top-to-bottom scrolling interface ensures that users focus on one topic at a time, reducing cognitive load and maintaining a structured learning flow.
- **Enhanced Readability:**  
  Rendering code blocks, math equations, and quoted messages in dedicated containers enhances clarity and readability, making it easier for users to differentiate between types of content.
- **Active Engagement:**  
  Interrupting the lecture with an engagement question at the end of each topic reinforces learning by prompting users to reflect on and apply what they’ve learned, thereby improving retention.
- **Progress Awareness:**  
  The inclusion of a table of contents provides users with a clear view of their progress and facilitates easy navigation to previously completed topics, supporting a self-paced learning approach.
- **Immediate Support:**  
  Providing access to a chat assistant ensures that users can receive timely help and explanations, which is crucial for addressing uncertainties and maintaining engagement throughout the lecture.
   
    
2. ## <a id="fr-004"></a>Engagement Question  
**Requirement ID**: FR-004
   
**UI Requirement**: TBD  

**Descriptions**:
- **Context of the question**:
    - The question shall be related to the current topic.
- **Flow interruption**: 
    - Users are required to provide a response to the question before proceeding to the next topic.
- **Types of question**: 
    - There shall be two types of engagement questions: multiple-choice and free-text-response.
- **Rendering order**:
    - The system shall present an engagement question at the end of each topic page, embedded at the end of the flow, not in separate page.
- **Answer feedback**:
    - Upon submitting their response, the system shall provide feedback, including an explanation or additional information, regardless the answer was correct or incorrect.
    - After receiving feedback, the system shall offer the user the option to ask one additional question or proceed with the next topic via rendering two buttons after the question.
         
#### Acceptance Criteria:
- The system must display an engagment question at the end of each topic page.
- The engagement question must be either a multiple-choice question or a free-text-response question.
- The question must be embedded within the topic page, not on a separate page.
- Users must be requuired to submit a response to the question to proceed to the next topic.
- Upon submission, the system must provide feedback on the response, including an explanation or additional information, regardless of correctness.
- After feedback is provided, the system must present the user with two options: to ask one additional question or proceed with the next topic via rendering two buttons after the question.

#### Rationale:
- **Active Engagement**:
    - Interrupting the lecture with an engagement question at the end of each topic reinforces learning by prompting users to reflect on and apply what they’ve learned, thereby improving retention.
- **Immediate Feedback**:
    - Providing immediate feedback, regardless of correctness, allows users to quickly correct misunderstandings and gain deeper insights into the topic. Additionally, the option to ask to provide another question at users request, to further solidify understanding, addressing uncertainties and maintaining engagement.
- **Personalized Learning**:
    - The ability to seek clarification on specific points of confusion through the chat assistant after receiving feedback supports a tailored learning experience, meeting individual user needs.
- **Linear Navigation Focus**:
    - Embedding the engagement question within the topic page ensures a seamless, linear flow of learning, reducing cognitive load and maintaining focus on the current topic without disrupting the user’s concentration.
      
3. ## <a id="fr-002"></a>Assistive AI Chat
**Requirement ID**: FR-002  

**UI Requirement**: UI-003.5  

**Descriptions**:
   - The system shall be accessible within the Lecture Scene (SC-003), utilizing a vertical sliding behavior within its own UI layer. Users can open or close the chat system via a toggle button within the Lecture Scene.
   - The system shall maintain context awareness by tracking both the topic and chat history for interactions between the chat assistant and users. The system shall erase the chat history once moved forward to different topic.
   - The system shall provide **dedicated fields** with **specialized formatting support** and ensure compatability to standard rendering for entering programming code or mathematical equations. It will automatically detect such inputs and prompt users to embed a **special field** for the detected format. Users can also manually embed these **dedicated fields** via button in the chat text field.
   - The system shall support multiple dedicated fields within the input flow, each functioning as a self-contained unit. users shall be able to create, delete, and navigate between these fields, as well as return to a standard text input.
   - The system shall provide additional keyboard input for commonly used characters when the typing keyboard and a special container mode is active, reducing the need for users to browse the default keyboard system. UI buttons that simulate keyboard keys shall be available while users are typing. (e.g., **tab** button for tab spaces when writing a programming code)
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
   - **Scene ID**: SC-005
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
   - **SC ID**: SC-006
   - **Descriptions**:
      - Daily Quiz
         - // Proceeds with the activity every first open of app for the day
         - // It should precedes everything
         - // Levels of questions
            - // 1. basic (e.g., multiple choice, simple identification) 1 to 2 days. Occurs 7 times 
            - // 2. intermediate (e.g., simple problem solving, answer) 3 to 4 days. Occurs 7 times
            - // 3. advance (e.g, advance problem solving) 7-8 days. Occurs 7 times
            - // 4. master (e.g., explanation, practical challenges) 14-15 days. Occurs 7 times
       - Optional Quiz
          - // Provides 5 questions
          - // Does not change the progress of each question
          - // Randomly chooses questions from the question pool. Level of question is chosen at random
2. ### <a id="fr-007"></a>Personal Achievement Scene
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
   - **Scene ID**: SC-009
10. ### Setting Scene
   - **Requirement ID**: FR-010
   - **Scene ID**: SC-010
   - **Description**:
      - // Dark/light mode
      - // Subscription
      - // Delete account
      - // 

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
