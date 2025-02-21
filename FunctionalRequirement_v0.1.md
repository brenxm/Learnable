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


## Table of contents
|Requirement ID|Title|Subdomain|
|:---|:---|:--- |
| FR-001 | Home Page | |
| [FR-003](#fr-003) | Lecture Scene || 
| [FR-004](#fr-004)| Engagement Question |
| [FR-005](#fr-005)| Assistive AI Chat |
| [FR-006](#fr-006)| Table of Contents |
| [FR-007](#fr-007)| Subject Management |
| [FR-008](#fr-008)| Subject Creation |
| [FR-009](#fr-009)| Daily Quiz |
| [FR-010](#fr-010)| Optional Quiz |

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
   
**UI Requirement**: SC-003.6

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
      
3. ## <a id="fr-005"></a>Assistive AI Chat
**Requirement ID**: FR-005  

**UI Requirement**: UI-003.5  

**Descriptions**:
- The system shall be accessible within the Lecture Scene (SC-003), utilizing a vertical sliding behavior within its own UI layer. Users can open or close the chat system via a toggle button within the Lecture Scene.
- The system shall maintain context awareness by tracking both the topic and chat history for interactions between the chat assistant and users. The system shall erase the chat history once moved forward to a different topic.
- The system shall provide **dedicated fields** with **specialized formatting support** and ensure compatability to standard rendering for entering programming code or mathematical equations. It will automatically detect such inputs and prompt users to embed a **special field** for the detected format. Users can also manually embed these **dedicated fields** via button in the chat text field.
- The system shall support multiple dedicated fields within the input flow, each functioning as a self-contained unit. Users shall be able to create, delete, and navigate between these fields, as well as return to a standard text input.
- The system shall provide additional keyboard input for commonly used characters when the typing keyboard and a special container mode is active, reducing the need for users to browse the default keyboard system. UI buttons that simulate keyboard keys shall be available while users are typing. (e.g., **tab** button for tab spaces when writing a programming code)
     
#### Acceptance Criteria
- The chatbox should slide in top-bottom vertical behavior in it's own page (separate page in front of the topic page).
- The chatbox should open via engaging in type mode (clicking the chat assistant text field) and can be closed by clicking the close button while chatbox is active.
- The chat should retain the history of messages between the user and the AI.
- Chat history should reset after moving to another topic.
- Similar to **Specialized Content Rendering** of the **lecture requirement**, responses of the AI assistant that has special contents such as math expressions, programming codes and quouted messages should be rendered in their respective styling.
- The user should be able to activate a special typing mode, where once active, it enables an automatic formatting to the text that follows the current standard rendering. (TODO: Design specs should be written here for programming codes and math latex)
- While typing, the system should constantly monitor what the text is, if the text is to be predicted as a **specialized content** (code or math expression), it should highlight the text and prompt the user to activate a typing mode.
- While in typing mode, the keyboard should provide additional keyboard key for the commonly used characters for that mode that is not provided by the default keyboard. (TODO: Separated design spec should be provided)
- The chatbox should support multiple **dedicated fields** and the users have the option to create new field, step out (return to normal input), delete or enter to an existing field.

#### Rationale
- **Seamless Integration with Lecture Scene**:
- The vertical sliding behavior and toggle button ensure the chat system integrates smoothly into the Lecture Scene without disrupting the user's focus on the primary content. By residing in its own UI layer, the chat remains accessible yet unobtrusive, allowing users to engage with the assistant as needed while maintaining a clean and intuitive interface. This aligns with UI-003.5’s goal of providing a cohesive and user-friendly experience.
- **Context Awareness for Enhanced Interaction**:
- Maintaining chat history and topic awareness enables the AI to provide relevant, coherent responses based on prior interactions, mimicking a natural conversation flow. Resetting the history when switching topics ensures that the assistant remains focused on the current subject, avoiding confusion or irrelevant responses. This is particularly valuable in an educational context where discussions often pivot between distinct concepts.
- **Support for Specialized Content**:
- The inclusion of dedicated fields with specialized formatting for programming code and mathematical equations addresses the need for precise, visually distinct rendering of technical content. Automatic detection and prompting for these formats reduce user effort, while manual embedding options empower advanced users with control. This dual approach accommodates varying levels of user expertise, ensuring accessibility for beginners and flexibility for experts.
- **Efficient Multi-Field Management**:
- Supporting multiple dedicated fields within the chat flow allows users to structure complex queries or responses (e.g., combining code snippets, equations, and explanatory text). The ability to create, delete, and navigate between fields enhances usability by offering a modular, organized input system. Returning to standard text input ensures versatility, catering to both technical and casual interactions.
- **Optimized Typing Experience**:
Providing additional keyboard inputs for commonly used characters (e.g., tab spacing in code) while in special container mode minimizes friction during technical input. This feature reduces reliance on default keyboard browsing, which can be cumbersome for frequent symbols or formatting needs in programming and mathematics. The UI buttons simulating keyboard keys further streamline the process, improving efficiency and user satisfaction.
- **Educational and Practical Value**:
- The combination of context retention, specialized rendering, and enhanced typing capabilities ensures the chat system is a powerful tool for learning and problem-solving. By rendering AI responses with proper styling (e.g., syntax-highlighted code, LaTeX-formatted equations), users receive clear, professional-grade feedback that mirrors real-world standards, reinforcing comprehension and application of lecture material.
  
4. ## <a id="fr-006"></a>Table of Contents
**Requirement ID**: FR-006
**UI Requirement**: UI-003.4
#### Descriptions:
- The system shall display all topics in a list format within the Table of Contents, providing users with a comprehensive overview of the subject’s structure.
The Table of Contents shall be accessible within the Lecture Scene (SC-003) via a toggle button, allowing users to open or close it as needed without leaving the current context.
- The system shall allow navigation to completed topics by selecting them from the list, while preventing navigation to uncompleted topics to enforce sequential progress.
- The system shall display the current progress of the subject, visually indicating how much of the content has been completed by the user.
- The system shall signify the current topic with a distinct visual marker (e.g., bold text, highlight, or icon) to orient the user within the subject.
- The system shall indicate when a quiz is available and ready for a specific topic, using a clear visual cue (e.g., a badge or icon) to prompt user engagement.
- The system shall distinguish completed topics from uncompleted topics by rendering the text of uncompleted topics in gray, while completed topics remain in a standard, readable color (e.g., black or theme default).
  
#### Acceptance Criteria
- The Table of Contents must present all topics in a vertically scrollable list, ensuring visibility of the entire subject structure, even for lengthy subjects.
- The toggle button must be prominently placed within the Lecture Scene and, when clicked, smoothly open or close the Table of Contents in its own UI layer without obstructing the lecture content.
- A horizontal sliding gesture (left-right) can also be used to open or close the Table of Contents section.
- Clicking on a completed topic in the list must immediately navigate the user to that topic, while clicking on an uncompleted topic must have no effect or display a brief message (e.g., “Topic not yet unlocked”).
- The current topic must be visually distinct (e.g., bolded, highlighted, or marked with an icon) and automatically updated as the user progresses through the subject.
- Completed topics must appear in a standard, legible color (e.g., black), while uncompleted topics must be rendered in gray, with sufficient contrast to remain readable but clearly differentiated.
- The system must refresh the Table of Contents state (progress, current topic, quiz availability) in real-time as the user interacts with the Lecture Scene.
  
#### Rationale
The Table of Contents (FR-006) serves as a navigational and motivational tool within the Lecture Scene, enhancing user experience by providing structure, clarity, and feedback on progress. The following points justify its design and functionality:

- **Comprehensive Topic Overview**:
- Displaying all topics in a list format offers users a clear roadmap of the subject, fostering an understanding of its scope and sequence. This is essential for educational contexts where users benefit from knowing what lies ahead and how topics interrelate.
- **Seamless Accessibility**:
- The toggle button ensures the Table of Contents is readily accessible without disrupting the Lecture Scene workflow, while its seamless integration with the main topic page and smooth transition animation help users maintain focus.
- **Controlled Progression**:
- Restricting navigation to completed topics enforces a logical learning sequence, preventing users from skipping foundational material. This supports educational integrity and ensures users build knowledge incrementally, which is critical for subjects with interdependent concepts.
- **Contextual Awareness**:
- Signifying the current topic keeps users oriented within the subject, reducing cognitive load and enhancing focus. This is particularly valuable in long or complex lectures where users might otherwise lose track of their position.
- **Visual Differentiation**:
- Rendering uncompleted topics in gray provides an immediate, intuitive distinction from completed topics, leveraging color psychology to signal accessibility. This visual cue simplifies decision-making and reinforces the sequential progression model.


## <a id="fr-007"></a>Subject Management
1. ### Subject Management Scene
**Requirement ID**: FR-007  

**Scene ID**: TBD
#### Descriptions:
- Users should be able to create a new subject from this scene, allowing them to add new learning modules or courses to their list.
- Users can delete a subject, with a confirmation step to prevent accidental removal.
- Users can choose a subject from this scene to access its associated content, such as lectures or quizzes.
- Users can sort subjects based on:
   - **Name**: Alphabetical order (A-Z or Z-A).
   - **Progress in percent**: Percentage of completion (e.g., 0% to 100%).
   - **Last date of accessed**: Date the subject was last viewed, from most recent to oldest.
- Each subject on the list should display:
   - **Title**: The name of the subject in a clear, prominent format.
   - **Progress in percent**: A percentage indicating how much of the subject has been completed (e.g., "75%").
   - **Date last time accessed**: The most recent date the subject was opened (e.g., "2023-10-10").
   - **Total of chapters**: The total number of chapters or sections in the subject (e.g., "10 chapters").
- Each subject should have a button at the very right where, when clicked, it will open up a list of options, including "Delete" and potentially other actions like "Rename" or "Archive."
#### Acceptance Criteria:
- **Creating a Subject**:
   - A "Create New Subject" button must be visible and functional, allowing users to add a new subject.
Upon creation, the users must be navigated to the **New subject creation page**.
- **Deleting a Subject**:
   - Selecting "Delete" from the options button must trigger a confirmation prompt (e.g., "Are you sure you want to delete this subject?").
   - After confirmation, the subject must be removed from the list.
- **Choosing a Subject**:
   - Clicking a subject (outside the options button) must navigate the user to that subject’s content or overview page.
   - Navigation must occur without delay or errors.
- **Sorting Subjects**:
   - A sorting control (e.g., dropdown or buttons) must allow selection of name, progress, or last accessed date.
   - The list must update instantly to reflect the chosen sorting order.
- **Subject Display**:
   - Each subject entry must show:
      - **Title** (e.g., "Mathematics").
      - **Progress in percent** (e.g., "50% complete").
      - **Last accessed date** (e.g., "Last accessed: October 10, 2023").
      - **Total chapters** (e.g., "8 chapters").
   - Information must be accurate and visually distinct (e.g., progress as a percentage or bar).
- **Options Button**:
   - A button (e.g., three dots or gear icon) must appear at the far right of each subject.
   - Clicking it must display a menu with at least "Delete" as an option.
   - The menu must be easy to access and dismiss.
- **Edge Cases**:
   - If no subjects exist, display a message like "No subjects available. Create one to begin."
   - Subjects with no progress (0%) or no access history ("Never accessed") must still display correctly.
#### Rationale:
The Subject Management Scene is a core feature for users to organize and interact with their educational content. Here’s why each component is included:

- **Creating and Deleting Subjects**:
   - Users need the ability to add new subjects as their learning needs evolve and remove those no longer relevant, ensuring a tailored experience. The confirmation on deletion protects against mistakes.
- **Choosing Subjects**:
   - Direct access to a subject’s content from this scene simplifies navigation, making learning more efficient and intuitive.
- **Sorting Functionality**:
   - Sorting by name, progress, or last accessed date accommodates different user priorities—finding subjects quickly, tracking progress, or resuming recent work—enhancing usability.
- **Subject Information Display**:
   - Showing title, progress, last accessed date, and chapter count gives users a clear overview, motivating them with progress visibility and informing them of subject scope and recency.
- **Options Button**:
   - Placing actionable options (like "Delete") in a right-side button keeps the interface clean while providing essential controls. This design balances functionality with simplicity.

  
2. ### <a id="fr-008"></a>Subject Creation Scene
**Requirement ID**: FR-008  

**Scene ID**: SC-005  

#### Descriptions:
   The Subject Creation Scene is a 3-step wizard designed to help users generate a customized curriculum for a new subject. The wizard takes user inputs and preferences to create a structured output in the following structured format:
- **A title**:
   - This is a string that represents the name or identifier of the entire structure, such as curriculum or course.
- **A list of subjects**:
   - This is a collection of subjects, where each subject is an individual entity. There must be at least on subject.
- **Each subject contains**:
   - **A list of topics**:
      - A collection of topics, where each topic is represented as a string. Each subject must have at least one topic in its list.
```
Curriculum Title
   Subject 1
      Topic 1
      Topic 2
   Subject 2
      Topic 1
      Topic 2
```        

**Here’s how the wizard works, step by step**:

### Step 1: Create Base Curriculum
 - **User Input**:
    - Users start by describing the subject or course in a free-text box. This description serves as the foundation for the AI to generate a curriculum or table of contents.
 - **Preset Options**:
    - An additional option allows users to select a preset (e.g., "comprehensive" or "basic to advanced") that modifies the curriculum’s depth and structure. This preset enhances the free-text input rather than replacing it.
 - **System Response**:
    - The system generates a curriculum based on the user’s description and selected preset (if any) and displays it for review.
 - **Editing**:
    - Users can confirm the curriculum as-is or edit it using an AI-assisted text field, which allows for real-time customization of the generated list.
### Step 2: Tone of Delivery
   - **Tone Customization**:
      - Users define how the content for each subtopic will be delivered by specifying a tone (e.g., "ELI5," "in a piratey way," or "like my mom") in a free-text input field.
   - **Preset Options**:
      - Similar to Step 1, preset tone options are available and can be combined with the free-text input for greater flexibility.
   - **Tone Preview**:
      - The system generates an example of how the tone will be applied to one of the curriculum topics. A "Refresh" button is provided to update the example if the user modifies the tone input—users must press this button to see changes reflected.
   - **User Control**:
      - This step ensures users can fine-tune the tone to make the content engaging and suited to their audience.
### Step 3: Add-ons
   - **Selection Method**:
      - Users are presented with clickable radio options to add extra features to the subject. These options are independent and can be toggled on or off.
   - **Available Add-ons**:
      - **Engagement Question**:
         - Adds an engagement question at the end of each topic to encourage interaction. (Default: True)
      - **Ending Project**:
         - Adds a hands-on, practical exercise at the end of each major topic (not subtopics). These projects are more challenging than engagement questions. (Default: True)
      - **Generate Voice**:
         - Generates narrated voice content for the entire subject. (Default: False)
      - **Generate Questions for Reinforcement**:
         - Adds questions to a reinforcement system (e.g., for spaced repetition or review). (Default: False)
      - **Final Action**:
         - A **Generate** button is placed at the bottom of this step. When clicked, it triggers the creation of the full subject material based on all prior inputs and navigates the user to a loading screen while the content is prepared.
#### How It All Ties Together
   - **Step-by-Step Flow**:
      - The wizard progresses sequentially from Step 1 (defining the curriculum) to Step 2 (setting the tone) to Step 3 (adding features). Each step builds on the previous one, ensuring a cohesive and personalized subject-creation process.
   - **Navigation**:
      - Users can effortlessly navigate through the steps by scrolling vertically, as each step is seamlessly connected in a single, continuous interface. This intuitive design eliminates the need for separate page transitions, keeping the process fluid and user-friendly. 
   - **User Feedback**: 
      - At every stage, the system provides previews or editable outputs, giving users control and confidence in the final product.
   - **Output**:
      - Once the "Generate" button is clicked, the system compiles the curriculum, applies the chosen tone, and incorporates the selected add-ons, delivering a fully customized subject ready for use.

#### Acceptance Criteria
The Acceptance Criteria outline the specific conditions that must be met to ensure the Subject Creation Scene works as intended. These are broken down by the three steps of the process and include general requirements:

#### Step 1: Create Base Curriculum
   - **Free-Text Input**:
      - The free-text box must accept user input and process it to generate a curriculum. The AI should produce a structured list of topics and subtopics based on the provided description.
   - **Preset Selection**:
      - Preset options (e.g., "comprehensive," "basic to advanced") must be selectable and modify the curriculum’s structure accordingly.
   - **Curriculum Preview and Editing**:
      - The system must display the generated curriculum in a clear, structured format, accompanied by a text field where users can input edits with AI assistance. Changes made by the user should take effect only after pressing the "Refresh" button.
#### Step 2: Tone of Delivery
   - **Tone Input**:
      - The free-text field for tone description must accept input, and preset tone options must be selectable.
   - **Tone Example Generation**:
      - The system must generate an example of the selected tone applied to a random topic from the curriculum. This example should only refresh when the "Refresh" button is clicked after changes are made.
   - **Refresh Functionality**:
      - The "Refresh" button must work only if either input text-field-box is filled or a preset option is selected, triggering a new tone example based on the current tone settings. 
#### Step 3: Add-ons
   - **Radio Options**:
      - Add-ons (e.g., Engagement Questions, Generate Voice) must be presented as clickable radio buttons or checkboxes, with default settings (e.g., Engagement Question: True, Generate Voice: False).
   - **Generate Button**:
      - A prominent "Generate" button must appear at the bottom of this step. When clicked, it must start the subject creation process and display a loading screen.
   - **Loading Screen**:
      - The loading screen must show a progress indicator or message to inform users that the subject is being generated.
#### General
   - **Navigation**:
      - Users must be able to move between the three steps freely by scrolling vertically until the final "Generate" action is completed.
   - **Error Handling**:
      - If any step is incomplete (e.g., no curriculum created), the system must display a prompt requiring the user to fill in the necessary fields before proceeding.
   - **Data Persistence**:
      - User inputs must be temporarily saved during the process, allowing users to go back and edit without losing their work.

#### Rationale
The Rationale explains why these features are included and how they support the overall purpose of the Subject Creation Scene:

- **Step-by-Step Wizard**:
   - Dividing the process into three steps—curriculum creation, tone selection, and add-ons—makes it easier for users to manage. This reduces complexity and helps users focus on one task at a time, improving the overall experience.
- **AI-Powered Curriculum Generation**:
   - Using AI to generate an initial curriculum saves time and provides a helpful starting point, especially for users unsure of how to structure their content. The editing option ensures they retain full control.
- **Tone Customization**:
   - Letting users define the tone ensures the content suits their audience and promotes personalized customization which enhances the learning experience. The tone preview builds confidence that the chosen tone will be consistently applied.
- **Add-ons for Enhanced Learning**:
   - Optional add-ons like engagement questions and voice narration enrich the learning experience, catering to diverse preferences and encouraging active participation.
- **User Control and Feedback**:
   - Features like the "Refresh" button and editable curriculum keep users in charge, while the loading screen confirms the system is processing their request.




## Reinforcement Feature
1. ## <a id="fr-009"></a>Daily Quiz Scene
**Requirement ID**: FR-009  
 
**SC ID**: SC-006
#### Descriptions:
The Daily Quiz Scene is a key feature designed to reinforce user learning through a structured, daily quiz activity. Here’s how it works:
- **Activation**:
   -  The quiz activates every time the app is opened for the first time each day. If the daily reinforcement activity (i.e., the quiz) hasn’t been completed, it takes precedence over all other app features, ensuring users engage with it before proceeding.
- **Question Formats**:
   - **Questions are presented in two formats**:
      - **Multiple Choice**:
         - Users select the correct answer from a set of options.
      - **Free-Text-Field**:
         - Users type their answers without provided options.
- **Question Presentation**:
   - The system shall present one question per page. Each page includes:
      - **Body of Question**:
         - The question text displayed promintently at the top
      - **Answer Input**:
         - Below the body, an input area (either multiple-choice options or a text field) for the user to respond.
      - **Submit Button**:
         - Positioned below the input area to submit the answer.
      - **Feedback Area**:
         - Located below the body of the question (and alongisde the input area), where feedback appears after submission. If the feedback is rendered, a "Next" button shall also appear to allow users to proceed to the next question.
- **Question Generation**:
   - All questions are generated based on topics the user has completed. Generation happens instantly upon topic completion, ensuring relevance to the user’s progress.
- **Question Pool**:
   - Generated questions are stored in a "question pool," which operates as a queue. The frequency assigned to each question determines whether it appears in the day’s reinforcement activity.
- **Levels of Questions**:
   - Questions are categorized into levels, each with specific attributes:
      - **Difficulty**:
         - How challenging the question is.
      - **Frequency:**
         - How often the question reappears.
      - **Format**:
         - How the question is presented (multiple choice or free-text).
      - **Occurrence**:
         - The number of times a question must be answered correctly before advancing to the next level.
#### Levels of Questions
- **Level 1**:
   - **Difficulty**: Basic
   - **Frequency**: Every 1-2 days
   - **Format**: Multiple choice
   - **Occurrence**: 7 correct answers required to progress
- **Level 2**:
   - **Difficulty**: Intermediate (e.g., simple problem solving)
   - **Frequency**: Every 3-4 days
   - **Format**: Multiple choice or free-text (system can use either)
   - **Occurrence**: 7 correct answers required to progress
- **Level 3**:
   - **Difficulty**: Advanced (e.g., advanced problem solving)
   - **Frequency**: Every 7-8 days
   - **Format**: Free-text
   - **Occurrence**: 7 correct answers required to progress
- **Level 4**:
   - **Difficulty**: Master (e.g., explanation, practical challenges)
   - **Frequency**: Every 14-15 days
   - **Format**: Free-text
   - **Occurrence**: 7 correct answers required to complete
- **Mastered Status**:
   - After completing Level 4 (7 correct answers), the question is marked as Mastered.
   - Mastered questions reappear every 20 days with a random difficulty level.
   - Users can disable the recurrence of mastered questions via the Question Management Scene.
#### Workflow
- **Generation**:
   - When a user completes a topic, questions are created and added to the question pool at Level 1.
- **Scheduling**:
   - Each question has a due date based on its frequency. The daily quiz includes questions whose due date is today or earlier.
- **Progression**:
   - When a question is answered correctly, its due date is updated within its level’s frequency range. After 7 correct answers at a level, it advances to the next level, updating its format and frequency.
- **Daily Quiz**:
   - On the first app open of the day, if questions are due, the quiz is presented. Users must complete it to access other features unless skipped. If no questions are due, the quiz is skipped.
 
     
#### Acceptance Criteria
To ensure the Daily Quiz Scene meets its intended purpose, the following must be verified:
- The quiz appears on the first app open of the day if the reinforcement activity hasn’t been completed and questions are due.
- The quiz is skippable, but if skipped, a notification or indicator must appear on the homepage showing that a quiz is due for today.
- Questions are generated instantly after a topic is completed and added to the question pool at Level 1.
- The system tracks each question’s level, frequency, format, and correct answer count accurately.
- For multiple choice questions, the system verifies correctness automatically.
- For free-text questions, the system shows the correct answer after submission, and the user self-assesses correctness.
- After 7 correct answers at a level, the question advances to the next level, with updated frequency and format.
- Mastered questions (post-Level 4) appear every 20 days with random difficulty unless disabled by the user in the Question Management Scene.
- If no questions are due, the quiz does not appear, and the app should navigate to the homepage immediately.
#### Rationale
The Daily Quiz Scene uses a spaced repetition approach to reinforce learning, gradually increasing question difficulty and intervals as users demonstrate mastery. By presenting the quiz on the first daily app open with a skippable option, it encourages consistent engagement while offering flexibility. The two question formats cater to different learning styles—multiple choice for quick recall, free-text for deeper understanding. The level system and question pool provide a structured progression, while the option to disable mastered questions respects user preferences, making the feature both effective and adaptable.

2. ## <a id="fr-010"></a>Optional Quiz
**Requirement ID: FR-010  

**Scene ID: TBD

#### Descriptions

The Optional Quiz is a user-initiated feature designed to provide additional practice without impacting the progress or attributes of questions in the main reinforcement system. Here’s how it functions:

- **Question Quantity**:
   - The system shall present 5 questions at a time per quiz session.
- **Question Selection**:
   - Questions are pulled randomly from the existing "question pool" (as used in the Daily Quiz Scene). The selection includes:
      - **Random Difficulty**: Any difficulty level (Basic, Intermediate, Advanced, Master).
      - **Random Format**: Either multiple choice or free-text, independent of the question’s original level-specific format.
- **Non-Impactful**:
   - Completing or answering questions in the Optional Quiz does not update the progress, frequency, occurrence count, or any other attributes of the questions in the question pool.
- **Question Presentation**:
   - The rendering and format for displaying each question match the Daily Quiz Scene (FR-006):
      - One question per page.
      - Includes the body of the question, an answer input area (multiple choice options or text field), a submit button, and a feedback area below the question body.
      - After submission, feedback is rendered, and a "Next" button appears to proceed to the next question.
- **Error Handling and Termination**:
   - **No Time Limit**: There is no timeout or time restriction for completing the quiz.
   - **App Termination**: If the app is closed or terminated while the quiz is in progress, no data is saved or affected. Upon reopening the app, it resumes normal operation, bypassing the quiz unless the user initiates it again.
#### Workflow
1. Users manually start the Optional Quiz from an accessible point in the app (e.g., a button on the homepage or a menu).
2. The system randomly selects 5 questions from the question pool, ignoring their current level or due status.
3. Questions are presented one at a time, following the same layout as the Daily Quiz.
4. After answering all 5 questions, the quiz ends, returning the user to normal app operation.
5. If interrupted (e.g., app closure), the quiz resets upon the next app launch, with no record of the prior session.
#### Acceptance Criteria
To ensure the Optional Quiz meets its intended purpose, the following conditions must be verified:

- The quiz presents exactly 5 questions per session when initiated.
- Questions are randomly selected from the question pool, with varying difficulty (Basic, Intermediate, Advanced, Master) and format (multiple choice or free-text) each time.
- Answering questions (correctly or incorrectly) does not alter the question’s progress, frequency, occurrence count, or level in the question pool.
- Each question page displays:
   - The question body.
   - An answer input (multiple choice options or text field) below the body.
   - A submit button below the input.
   - Feedback below the question body after submission, with a "Next" button to proceed.
- The quiz has no time limit; users can take as long as needed to answer each question.
- If the app is terminated mid-quiz (e.g., closed or crashed), no quiz progress is saved, and reopening the app navigates to the homepage or normal operation without resuming the quiz.
- The quiz is only accessible via user initiation (e.g., a button or menu option), not triggered automatically like the Daily Quiz.
#### Rationale
The Optional Quiz provides a low-stakes, flexible practice option for users who want additional engagement without affecting their structured learning progress. Here’s why each aspect is included:

- **Fixed Question Count (5)**: Limiting the quiz to 5 questions keeps it manageable and focused, encouraging casual use without overwhelming the user.
- **Random Selection**: Pulling questions randomly from the pool with varying difficulty and format ensures variety and unpredictability, making it a fun and challenging practice tool.
- **Non-Impactful Design**: By not updating question attributes, the feature preserves the integrity of the spaced repetition system in the Daily Quiz, maintaining its effectiveness while offering supplemental practice.
- **Consistent Presentation**: Reusing the Daily Quiz’s question layout ensures a familiar user experience, reducing the learning curve and maintaining visual consistency across the app.
- **No Time Limit**: Removing time pressure accommodates different paces and preferences, making the quiz accessible to all users.
- **Termination Handling**: Allowing app closure without consequences aligns with the optional nature of the feature, ensuring it’s a stress-free addition to the app. 
  
This feature enhances user autonomy and supports voluntary learning, complementing the app’s structured reinforcement system with a casual, user-driven alternative.




     
2. ### <a id="fr-007"></a>Personal Achievement Scene
   - **Requirement ID**: FR-007
   - **Scene ID**: SC-002
   - **Description**:
      Personal Achievement Scene
	This is where user will view and track their overall progress
	It shall display the progress to the users:
		Total of generated subjects
		Total of completed subjects
		Total of questions generated
		Total of questions answered
		Total of time studying

	It shall also display the streaks of studied daily
	and streaks of took the quiz
		
	
	System -> Evaluate the efficiency and mastery of each subject
		    based on the completion of each subjects percentage
		    based on total generated questions and correct answers

	The system shall present the evaluation to a graph and an AI that explain what 
	the users are not proficient by examining the wrong answers. Pending progressions
		
		
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
