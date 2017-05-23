## ��������� ��������� ����� �������� ������� - ��������� e_gen(b) � e_kill(b)

#### ���������� ������
���������� ���������� ������ ���������� � ��������� ��� ������� ����� � �����
���������� �������� E_Gen � E_Kill

####�������� ���������
�� �������� �� ������ ���� ������ � ��� ������� �������� ���������. �������������� ��������� ��� ������� ����� ���������� � ������� ��������, ��� ������ ��������� ��� �����.
������ ���� �������������� ����������, ������� ������ ������������� ������ ���������� � ������� ���������, �� ������������. 

####������� ������
������� ����

#### �������� ������ 

��������� ���������

#### ���������� ���������
E_Gen - ��������� ���������, ������������ � ������� �����.
E_Kill - ��������� ���������, ������������ � ������� �����

���������� ```genKills = new GenKillExprs(cfg);```
� ����� ����� � ```genKills.Gen[block]``` ���������� ���������, ������� ������������ ��� ����� �����
� ```genKills.Remove[block]``` ���������� ���������, ������� ��������� � ���� �����

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


