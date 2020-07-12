# 隐式动画

> 简单的说 就是用`setState`或者其他机制比如`StreamBuilder`就能呼唤出来的动画,对于实现了隐式动画的组件，只要widget被更新就会自动产生并播放动画
>
> 在这之前过度动画的使用简直非常繁琐了
>
> 代码也符合了flutter 的声明式风格
>
> 例如`AnimatedContainer`