<map version="freeplane 1.7.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Purpose" FOLDED="false" ID="ID_1487424907" CREATED="1549554430740" MODIFIED="1549554610159" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="2" RULE="ON_BRANCH_CREATION"/>
<node TEXT="1. Allow easy simulation testing of stock assessment models" POSITION="right" ID="ID_1405940111" CREATED="1549554614570" MODIFIED="1549554636896">
<edge COLOR="#ff0000"/>
<node TEXT="1. Easy to use R code" ID="ID_657456601" CREATED="1549554758064" MODIFIED="1549554771466">
<node TEXT="Have to assume some R ability, but shouldn&apos;t need to be guru" ID="ID_964501316" CREATED="1549555136396" MODIFIED="1549555904043"/>
<node TEXT="Will require strong documentation and ability to edit code" ID="ID_1673937791" CREATED="1549555166135" MODIFIED="1549555192050"/>
<node TEXT="Use text files for inputs/outputs" ID="ID_803458183" CREATED="1549555984099" MODIFIED="1549556022627"/>
</node>
<node TEXT="2. Based on actual assessment results" ID="ID_1006545207" CREATED="1549554775614" MODIFIED="1549554798494">
<node TEXT="ASAP, SAM, SS?, VPA?, ASPIC?, data-limited? what is scope?" ID="ID_1701530475" CREATED="1549555198128" MODIFIED="1549555231182"/>
<node TEXT="Need to be able to read and write files for each program" ID="ID_1261086519" CREATED="1549555232730" MODIFIED="1549555262595"/>
<node TEXT="Should be easy to modify truth to examine alternative scenarios" ID="ID_1268224714" CREATED="1549555271035" MODIFIED="1549555298680"/>
</node>
<node TEXT="3. Allow full control over error structures" ID="ID_1404297895" CREATED="1549554800499" MODIFIED="1549554818653">
<node TEXT="Lognormal, multinomial, gamma?, Dirichlet?" ID="ID_1467884204" CREATED="1549555302352" MODIFIED="1549555385007"/>
<node TEXT="Need to think of easy to use ways of making changes" ID="ID_129428663" CREATED="1549555386256" MODIFIED="1549555411032"/>
</node>
<node TEXT="4. Easy to modify input options for stock assessment programs" ID="ID_644242073" CREATED="1549554819623" MODIFIED="1549554841123">
<node TEXT="Perhaps default to matching OM and then just enter changes from there?" ID="ID_1564256174" CREATED="1549555412737" MODIFIED="1549555453269"/>
<node TEXT="Want to be able to do this both interactively (Shiny?) and systematically over large number of changes" ID="ID_1209794024" CREATED="1549555462365" MODIFIED="1549555564278"/>
</node>
<node TEXT="5. Compare and contrast multiple stock assessment programs" ID="ID_1804356728" CREATED="1549554843514" MODIFIED="1549554859404">
<node TEXT="Think in advance what we want to compare as output metrics across models" ID="ID_607323596" CREATED="1549555597201" MODIFIED="1549555618073"/>
<node TEXT="Want both graphics and tables of results" ID="ID_135128962" CREATED="1549555619480" MODIFIED="1549555632769"/>
</node>
<node TEXT="6. Bookkeeping behind the scenes (low impact on users)" ID="ID_611905801" CREATED="1549554860829" MODIFIED="1549554893844">
<node TEXT="User shouldn&apos;t have to know the gory details, but should be able to find them if interested" ID="ID_689091034" CREATED="1549555634846" MODIFIED="1549555664313"/>
</node>
<node TEXT="7. Easy to see when/where operating and estimating models match/mismatch" ID="ID_1068406258" CREATED="1549554894785" MODIFIED="1549554923410">
<node TEXT="Summarizing match/mismatch of OM/EM will make it easy to run lots of comparisons and keep track of what was done" ID="ID_983756561" CREATED="1549555671091" MODIFIED="1549555713376"/>
<node TEXT="Graphic and table" ID="ID_126078301" CREATED="1549555853909" MODIFIED="1549555880790"/>
</node>
<node TEXT="8. Standard graphics to summarize repeated realizations" ID="ID_1968126191" CREATED="1549554926411" MODIFIED="1549554947315">
<node TEXT="Want to make it easy for users" ID="ID_1454444725" CREATED="1549555721434" MODIFIED="1549555745506"/>
<node TEXT="Allow new packages/approaches as they become available" ID="ID_39797860" CREATED="1549555748712" MODIFIED="1549555766836"/>
</node>
<node TEXT="9. User interface to guide through steps" ID="ID_1605165433" CREATED="1549554948781" MODIFIED="1549554970810">
<node TEXT="This can wait until end to do, but want to keep it in mind during development" ID="ID_288722972" CREATED="1549555768069" MODIFIED="1549555792417"/>
<node TEXT="A sort of AI to prevent dumb combinations from being examined" ID="ID_1561814400" CREATED="1549555918095" MODIFIED="1549555938494"/>
</node>
<node TEXT="10. Easily transportable across machines to allow sharing" ID="ID_712885701" CREATED="1549554972170" MODIFIED="1549555002774">
<node TEXT="Especially nice would be ability to put it on mainframes to run big jobs" ID="ID_823040933" CREATED="1549555797057" MODIFIED="1549555818425"/>
<node TEXT="How big an audience do we expect for this package?" ID="ID_1301409174" CREATED="1549555821265" MODIFIED="1549555836725"/>
</node>
</node>
</node>
</map>
