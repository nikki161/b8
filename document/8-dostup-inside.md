## ��������� ��������� ������ ���(+�����������)

#### ���������� ������
����� ��������� ��������� ������ ������� ������.

####�������� ���������
��������� �+� �������� � ����� P, ���� ����� ���� �� ���������� ���� � � �������-
�� �+� � ����� ������ ���������� � �� ���������� � ��� ����������� ���������� �
��� �.  ���� ���������� ��������� x+y, ���� �� ��������� x+y � �� ��������� ����������� ��������������� x � y.

![enter image description here](https://pp.userapi.com/c637618/v637618517/55f10/wCXvDbqidx0.jpg)

####������� ������
������� ����

#### �������� ������ 

��������� ���������

#### ���������� ���������
```
public Expression(Operation op, IValue leftOper, IValue rightOper)
        {
            Op = op;
            LeftOper = leftOper;
            RightOper = rightOper;
        }

        public Expression()
        {
            LeftOper = null;
            RightOper = null;
            Op = Operation.NoOperation;
        }

        public override bool Equals(object obj)
        {
            if (obj is Expression)
            {
                Expression Other = (Expression)obj;

                return Other.Op == this.Op &&
                    //������������� ������
                    ((LinearHelper.IsBinOp(this.Op) || this.Op == Operation.Mult || this.Op == Operation.Plus) &&
                    (Other.LeftOper.Equals(this.LeftOper) && Other.RightOper.Equals(this.RightOper) || Other.LeftOper.Equals(this.RightOper) && Other.RightOper.Equals(this.LeftOper)) ||
                    //��������������� ������
                    Other.LeftOper.Equals(this.LeftOper) && Other.RightOper.Equals(this.RightOper));
            }
            else
                return false;
        }
```
----------


