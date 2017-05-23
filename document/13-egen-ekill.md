## ƒоступные выражени€ между базовыми блоками - множества e_gen(b) и e_kill(b)

#### ѕостановка задачи
Ќеобходимо произвести анализ переменных и выражений дл€ каждого блока с целью
построени€ множеств E_Gen и E_Kill

####ќписание алгортима
ћы проходим по списку всех блоков и дл€ каждого собираем множества. –езультирующие множества дл€ каждого блока записываем в словарь множеств, где ключом выступает им€ блока.
 аждый блок обрабатываетс€ процедурой, котора€ хранит ассоциативный массив переменных и списков выражений, их использующих. 

####¬ходные данные
Ѕазовый блок

#### ¬ыходные данные 

ћножество выражений

#### –еализаци€ алгоритма
E_Gen - множество выражений, генерируемых в базовом блоке.
E_Kill - множество выражений, уничтожаемых в базовом блоке

¬ызываетс€ ```genKills = new GenKillExprs(cfg);```
и после этого в ```genKills.Gen[block]``` содержатс€ выражени€, которые генерируютс€ дл€ этого блока
¬ ```genKills.Remove[block]``` содержатс€ выражени€, которые удал€ютс€ в этом блоке

```
public GenKillExprs(CFGraph cfg)
        {
            var blocks = cfg.Blocks;

            foreach (var block in blocks)
            {
                BlockDefs[block] = new List<StringValue>();
                Gen[block] = new List<Expression>();
                Remove[block] = new List<Expression>();

                var countOfElems = block.Enumerate().Count();

                foreach (var elem in block.Enumerate().Reverse())
                {
                    if (elem.IsBinOp())
                    {
                        BlockDefs[block].Add(elem.Destination);

                        if (elem.Operation != Operation.NoOperation)
                        {
                            var expr = new Expression(elem.Operation, elem.LeftOperand, elem.RightOperand);

                            var hasThisExpr = AllExpressions.Any(iexpr => iexpr.Equals(expr));
                            if (!hasThisExpr)
                            {
                                AllExpressions.Add(expr);
                            }

                            if (!BlockDefs[block].Contains(elem.LeftOperand) && !BlockDefs[block].Contains(elem.RightOperand))
                            {
                                Gen[block].Add(expr);
                            }
                        }

                    }
                }

            }
```
----------


